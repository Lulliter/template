# TEMPLATE repo fo quarto website


## Inspiration

- Site https://stats.andrewheiss.com/mountainous-mackerel/
- Repo https://github.com/andrewheiss/mountainous-mackerel/tree/main

## Quarto Extensions

To add extensions to your Quarto website, you can use the `quarto add` command. Here are some examples of how to add popular extensions:

```bash
quarto add quarto-ext/fontawesome
quarto add quarto-ext/leaflet
quarto add quarto-ext/mermaid
quarto add quarto-ext/openai
```

## Zotero

For `*.bib` files collections to be exported (AND KEPT UPDATED) from Zotero, I need to install the plogin *Better BibTeX* for Zotero (find instrucitions) which will offer the "keep updated" option when exporting collections.


## XQuartz 
XQuartz (il sistema X Window System (X11) per macOS) necessario per i dispositivi grafici o i grafici interattivi in R.

```bash
brew install --cask xquartz
```

## Deploying on GH pages

+ add `.nojeckyll` file to the root of the gh-pages branch
+ set the site-url in `_quarto.yml` file: 
