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

## XQuartz 
XQuartz (il sistema X Window System (X11) per macOS) necessario per i dispositivi grafici o i grafici interattivi in R.

```bash
brew install --cask xquartz
```

## Deploying on GH pages

+ add `.nojeckyll` file to the root of the gh-pages branch
+ set the site-url in `_quarto.yml` file: 

## Package `renv`

The `renv` package is used to manage R package dependencies for the project, which makes it easier to reproduce the project environment on different machines. 


```R
# --- initialize to create a new renv environment
renv::init()

# --- snapshot (= SAVE as LATEST) the current state of R packages
renv::snapshot()

# --- restore (= REVERT to PREVIOUS) the R packages as per the lockfile
renv::restore()
```


### problema con `renv` e `gdtools` 
```R
renv::snapshot() # gives error "CairoContext.cpp:1:10: fatal error: 'string' file not found""
```
MEANS: the `gdtools` package is having trouble finding the necessary system libraries to compile its C++ code. This is often due to missing or misconfigured development tools on your system.

```bash
xcode-select --install 
# don't have full Xcode (needed for gdtools) installed, only the Command Line Tools.
```

Install Full `Xcode` from the App Store. 

Then 
```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license # "agree" to the license
```

Then try reinstalling `gdtools`:

```R
# install.packages("gdtools")
renv::install("gdtools")
```

### problema com `brew` 

Homebrew su Apple Silicon può installare librerie nella directory sbagliata (/usr/local → x86_64), mentre tu hai bisogno di quelle in /opt/homebrew (arm64). 

```bash
which brew
# /opt/homebrew/bin/brew
```

Reinstallare le librerie necessarie con il brew corretto:

```bash
# uninstall con il brew sbagliato
brew uninstall cairo freetype libpng fontconfig pixman libx11 libxext libxrender
# reinstall con il brew corretto
/opt/homebrew/bin/brew reinstall pkg-config cairo pango libpng jpeg giflib librsvg
```

### Soluzione finale

🔧 1. Forza pkg-config a usare solo le librerie arm64

Nel terminale, prima di avviare R, esporta la variabile PKG_CONFIG_PATH correttamente:

```bash
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig"
```
🔁 2. Avvia R nella stessa shell, poi installa gdtools:

```bash
R
install.packages("gdtools", type = "source")
# oppure
renv::install("gdtools")
```
This ensures che `pkg-config` cerchi le librerie nella directory corretta per Apple Silicon.


#### Aggiungere questa riga al file `.zshrc` o `.bash_profile` per renderla permanente:

Per far sì che questa impostazione sia permanente e non debba essere ripetuta ogni volta, aggiungi la riga di esportazione al tuo file di configurazione della shell (`.zshrc` per Zsh o `.bash_profile` per Bash):

```bash
open ~/.zshrc
# Aggiungi questa riga alla fine del file
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig"
# Rendi effettive le modifiche
source ~/.zshrc
# controlla
echo $PKG_CONFIG_PATH
  # /opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig
```

