# ----- [PRIMA VERIFICARE DI AVERE INSTALLATO npm e decktape] -----
# # Disinstalla Node x64 se presente
# brew uninstall node
# # Reinstalla versione arm64
# arch -arm64 brew install node
# # Installa decktape
# npm install -g decktape

# ----- Rendi e poi Converti file HTML in PDF usando decktape -----
#!/bin/bash
# --- Funzione per renderizzare Quarto slide e convertirle in PDF ---
qmd2pdf() {
  # 3 argomenti: nome file (senza estensione), cartella input, cartella output
  local file="${1%.qmd}"  # Rimuove .qmd se presente
  local inputdir="${2:-.}"  # Default: cartella corrente
  local outputdir="${3:-.}"  # Default: cartella corrente

  # Renderizza
  quarto render "${inputdir}/${file}.qmd"

  # Converti in PDF e apri
  decktape reveal "${inputdir}/${file}.html" "${outputdir}/${file}.pdf" && open "${outputdir}/${file}.pdf"
}


# --- Esempio [GENERALE] di utilizzo della funzione ---
# qmd2pdf "nomefile" "cartella_input" "cartella_output"
# --- Esempio [QUI] di utilizzo della funzione ---
# qmd2pdf IA_FB_note
