# TEMPLATE repo fo quarto website


## Inspiration

- Site https://stats.andrewheiss.com/mountainous-mackerel/
- Repo https://github.com/andrewheiss/mountainous-mackerel/tree/main


## Quarto

Intalla da https://quarto.org/docs/get-started/


```bash
 which -a quarto && quarto --version

# /Users/luisamimmi/Applications/quarto/bin/quarto
# /usr/local/bin/quarto
# /Applications/quarto/bin/quarto
# 1.8.25

```

## Quarto Extensions

To add extensions to your Quarto website, you can use the `quarto add` command. Here are some examples of how to add popular extensions:

```bash
quarto add quarto-ext/fontawesome
quarto add andrewheiss/quarto-wordcount 
quarto add andrewheiss/hikmah-academic-quarto   
quarto add quarto-ext/openai
```

## Zotero

For `*.bib` files collections to be exported (AND KEPT UPDATED) from Zotero, I need to install the plogin *Better BibTeX* for Zotero (find instrucitions) which will offer the "keep updated" option when exporting collections.

### RStudio add in for citations

Install the `citr` package in R to enable easy citation insertion in RMarkdown and Quarto documents.

```R
# if CRAN not current, use GitHub
remotes::install_github("crsh/citr")
```

## Deploying QUarto websites on GH pages

+ add `.nojeckyll` file to the root of the gh-pages branch
+ set the site-url in `_quarto.yml` file: 


## Some useful fomratting stuff

See files in `R/*`:

- `_fonts.qmd` (how to add fonts)
- `_parma_colors.qmd` (custom color palette)
- `issue_renv.md` (problem with `renv` and `gdtools`)
- `_f_*/.R`  (various functions)



--- 


## XQuartz 
XQuartz (il sistema X Window System (X11) per macOS) necessario per i dispositivi grafici o i grafici interattivi in R.

```bash
brew install --cask xquartz
```

