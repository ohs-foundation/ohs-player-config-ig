# OHS Player Configuration IG

A FHIR Implementation Guide that defines view, dashboard, card, etc. UI configurations for the OHS Player.

- **Live site:** https://ohs-foundation.github.io/ohs-player-config-ig/
- **Canonical:** `http://ohs.dev`
- **FHIR version:** 4.0.1
- **Status:** draft (`v0.1.0`)

## Repository layout

- **Remote:** `git@github.com:ohs-foundation/ohs-player-config-ig.git`
- **`main`** - IG sources only (`input/`, `sushi-config.yaml`, `ig.ini`, build scripts). `/output`, `/fsh-generated`, `/temp`, `/template`, `/input-cache` are gitignored.
- **`gh-pages`** - the built IG (contents of `output/`). GitHub Pages serves the root of this branch.

The two-branch model lives inside one repo. Do not re-init a separate git repo inside `output/`.

## First-time setup (fresh clone)

You need:

- **Docker** - runs the build inside `ghcr.io/bonfhir/ig-toolbox`, which bundles Java, SUSHI, and the IG Publisher.
- **Git 2.30+** - for the worktree-based publish flow below.

A native host build is also possible (Java 11+, curl, optionally `npm install -g fsh-sushi`) but is **not recommended**: version drift between host SUSHI / IG Publisher / Java causes intermittent build failures that don't show up in the container.

After cloning:

```bash
git clone git@github.com:ohs-foundation/ohs-player-config-ig.git
cd ohs-player-config-ig

# fetch the IG Publisher jar into input-cache/ (gitignored)
docker run -it --rm --user "$(id -u):$(id -g)" -v .:/workspaces ghcr.io/bonfhir/ig-toolbox ./_updatePublisher.sh -y

# first build - populates fsh-generated/, output/, template/, input-cache/txcache/
docker run -it --rm --user "$(id -u):$(id -g)" -v .:/workspaces ghcr.io/bonfhir/ig-toolbox ./_genonce.sh
```

`--user "$(id -u):$(id -g)"` makes the container write files as your host user. Without it, `fsh-generated/` and friends end up owned by root, and the next build (or any host-side tooling) hits `EACCES: permission denied`.

The first build downloads FHIR dependencies and the IG template; expect several minutes. Subsequent builds are fast.

If `_genonce.sh` prints `IG Publisher NOT FOUND in input-cache or parent folder`, you skipped `_updatePublisher.sh`.

## Updating the IG end-to-end

```bash
# 1. edit sources on main
git checkout main
# ... edit input/fsh, input/pagecontent, sushi-config.yaml ...
git add input sushi-config.yaml
git commit -m "..."
git push origin main

# 2. rebuild
docker run -it --rm --user "$(id -u):$(id -g)" -v .:/workspaces ghcr.io/bonfhir/ig-toolbox ./_genonce.sh

# 3. publish (worktree flow below)
```

## Publishing to GitHub Pages

### Before publishing - sanity checks

1. **Sources committed on `main`.** `git status` should be clean, and `git push origin main` should be a no-op.
2. **Canonical URL matches reality.** `sushi-config.yaml`'s `canonical:` should be the URL the IG will actually live at long-term. Mismatched canonicals don't break the build but produce artifacts whose internal URLs point off-site.
3. **Fresh build exists.** Run the Docker build above and confirm `output/index.html` opens locally.

### Publishing flow

Use a git worktree so you don't have to switch branches in the working tree (and so the gitignored `/output` stays out of the way).

```bash
# from repo root, with a fresh build in output/
git fetch origin gh-pages

# create or reset a local gh-pages branch matching origin, in a separate worktree
git worktree add -B gh-pages ../ohs-player-config-ig-pages origin/gh-pages

# replace published files with the fresh build
rm -rf ../ohs-player-config-ig-pages/*
cp -r output/. ../ohs-player-config-ig-pages/
touch ../ohs-player-config-ig-pages/.nojekyll

cd ../ohs-player-config-ig-pages
git add -A
git commit -m "Publish IG $(date -u +%Y-%m-%dT%H:%MZ)"
git push origin gh-pages

cd -
git worktree remove ../ohs-player-config-ig-pages
```

`-B gh-pages ... origin/gh-pages` creates the local branch on a fresh clone and resets it to match the remote on subsequent publishes. The local `gh-pages` is just a staging area - each publish supersedes the last, so resetting it is intentional.

`.nojekyll` matters: the IG output ships files/folders starting with `_` that Jekyll would otherwise hide.

### Handling `! [rejected] gh-pages -> gh-pages (fetch first)`

This means `origin/gh-pages` has commits you don't have locally - usually because someone else published, or the local branch drifted. **Don't force-push blindly.** Investigate first:

```bash
git fetch origin gh-pages
git log --oneline -5 gh-pages
git log --oneline -5 origin/gh-pages
git rev-list --left-right --count gh-pages...origin/gh-pages
# output is "<local-only-commits>\t<remote-only-commits>"
```

Then pick:

- **Remote has a publish you don't have, and your local build is newer** - reset local to remote and republish on top:
  ```bash
  git checkout gh-pages
  git reset --hard origin/gh-pages
  # then re-run the publishing flow above
  ```
- **Remote has a publish you don't have, and your local build is identical or older** - just discard local and pull:
  ```bash
  git checkout gh-pages
  git reset --hard origin/gh-pages
  ```
- **Local has a real publish that should win** - after confirming nothing on the remote is worth keeping, force-push:
  ```bash
  git push --force-with-lease origin gh-pages
  ```
  Use `--force-with-lease`, not `--force`. It refuses the push if the remote moved again since you fetched, which prevents you from clobbering a concurrent publish.

`gh-pages` history is treated as disposable (each publish supersedes the last), so force-push is acceptable here in a way it would never be on `main`.

### GitHub Pages settings

GitHub repo - **Settings - Pages**:
- Source: **Deploy from a branch**
- Branch: `gh-pages` / folder: `/ (root)`

Already configured; verify only if the site stops updating.

### Troubleshooting

#### `SUSHI: EACCES: permission denied, open 'fsh-generated/resources/...json'`

The build dirs (`fsh-generated/`, `output/`, `temp/`, `template/`, `input-cache/`) contain files owned by `root` from a previous container run that didn't pass `--user`. The next build then can't overwrite them.

Fix the ownership and rebuild with `--user` so it doesn't recur:

```bash
sudo chown -R "$USER:$USER" fsh-generated/ output/ temp/ template/ input-cache/ 2>/dev/null
docker run -it --rm --user "$(id -u):$(id -g)" -v .:/workspaces ghcr.io/bonfhir/ig-toolbox ./_genonce.sh
```

The same applies to the VS Code devcontainer: `.devcontainer/devcontainer.json` currently sets `"remoteUser": "root"`, so any build done via "Reopen in Container" leaves root-owned files behind. Either always build via the explicit `docker run` above, or update the devcontainer to drop the root user (the image has to tolerate a non-root user for this to work).

#### `Permission denied: ./_updatePublisher.sh` or `./_genonce.sh`

Executable bit was lost (Windows checkout, zip extraction). Restore it:

```bash
chmod +x _*.sh
```

#### `git push: Permission denied (publickey)`

Your SSH key isn't loaded or isn't authorized for the `ohs-foundation` org. Either add the key to your GitHub account, or switch the remote to HTTPS:

```bash
git remote set-url origin https://github.com/ohs-foundation/ohs-player-config-ig.git
```
