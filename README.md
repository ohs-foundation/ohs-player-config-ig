# OHS Player Configuration IG

A FHIR Implementation Guide defining the declarative UI configuration consumed by the **OHS (Open
Health Stack) Player**. It builds on the [SQL-on-FHIR](https://sql-on-fhir.org/ig/) `ViewDefinition` and
adds `ViewJoinMap`, `ViewConfig`, and a view-type vocabulary.

| | |
|---|---|
| Live site | https://ohs-foundation.github.io/ohs-player-config-ig/ |
| Canonical | `http://ohs.dev` |
| FHIR version | 4.0.1 |
| Status | draft (`v0.1.0`) |

## Source layout

```
input/fsh/
├── spec/         # Blueprint logical models: ViewJoinMap, ViewConfig
├── codesystems/  # Normative vocabularies: SearchScopeCS
└── examples/     # Example instances: viewdefinitions / viewjoinmaps / viewconfigs / viewtypes
input/pagecontent/ # Narrative (index + per-artifact intros)
```

Branches: **`main`** holds sources; **`gh-pages`** holds the built site (`output/`). Both live in one
repo — don't init a separate repo under `output/`.

## Build

The build runs in Docker (`ghcr.io/bonfhir/ig-toolbox`, which bundles Java, SUSHI, and the IG
Publisher). `--user` makes the container write files as you, avoiding root-owned build dirs.

```bash
# once: fetch the IG Publisher jar into input-cache/
docker run --rm --user "$(id -u):$(id -g)" -v .:/workspaces ghcr.io/bonfhir/ig-toolbox ./_updatePublisher.sh -y

# build: populates fsh-generated/ and output/ (open output/index.html)
docker run --rm --user "$(id -u):$(id -g)" -v .:/workspaces ghcr.io/bonfhir/ig-toolbox ./_genonce.sh
```

## Publish to GitHub Pages

Stage the built `output/` onto `gh-pages` via a worktree (keeps your working tree on `main`):

```bash
git worktree add -B gh-pages ../ig-pages origin/gh-pages
rm -rf ../ig-pages/*
cp -r output/. ../ig-pages/ && touch ../ig-pages/.nojekyll   # .nojekyll keeps files starting with _
git -C ../ig-pages add -A && git -C ../ig-pages commit -m "Publish IG"
git -C ../ig-pages push origin gh-pages
git worktree remove ../ig-pages
```

`gh-pages` history is disposable (each publish supersedes the last); if a push is rejected, reconcile
with `git -C ../ig-pages reset --hard origin/gh-pages` or `git push --force-with-lease`.

Pages settings: **Deploy from a branch** → `gh-pages` / `/ (root)` (already configured).

## Troubleshooting

- **`EACCES` writing `fsh-generated/`** — a previous container run left root-owned files. Run
  `sudo chown -R "$USER:$USER" fsh-generated output temp template input-cache`, then rebuild with
  `--user` as above.
- **`Permission denied: ./_genonce.sh`** — restore the exec bit: `chmod +x _*.sh`.
- **`IG Publisher NOT FOUND`** — run `_updatePublisher.sh` first.
