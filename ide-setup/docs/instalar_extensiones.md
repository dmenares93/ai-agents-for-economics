# Instalar extensiones de VS Code / Cursor para el proyecto

Guía rápida para dejar listas las extensiones que usamos para visualizar PDF, CSV, Excel, Word, Stata (`.dta`) y resaltar sintaxis de `.do` files.

## Que vamos a instalar

| Extension | Para que sirve | Como se instala |
|---|---|---|
| **Office Viewer** (`cweijan.vscode-office`) | Ver PDF, CSV, XLSX y DOCX dentro del editor | Marketplace (UI o terminal) |
| **Stata Viewer** (`diegomenares.stata-viewer`) | Previsualizar archivos `.dta` (Stata) | Marketplace (UI o terminal) |
| **Stata Enhanced** (`kylebarron.stata-enhanced`) | Syntax highlighting para `.do` / `.ado` | VSIX local (no esta en Open VSX) |

> Cursor usa **Open VSX** por defecto, que tiene menos extensiones que el Marketplace de VS Code. Las que existen en ambos se instalan igual; las que no, se distribuyen como `.vsix` en [../extensions/](../extensions/).

---

## Opcion A — desde la UI (recomendada)

1. Abre el panel **Extensions** (`Cmd+Shift+X` en macOS / `Ctrl+Shift+X` en Windows/Linux).
2. Busca por el **id** de la extension (ej: `cweijan.vscode-office`) y click en **Install**.
3. Para la extension que viene como `.vsix`:
   - Click en el icono `...` arriba del panel de Extensions.
   - **Install from VSIX...**
   - Selecciona [../extensions/stata-enhanced.vsix](../extensions/stata-enhanced.vsix).
4. Recarga la ventana si lo pide.

---

## Opcion B — desde terminal

### macOS / Linux

```bash
# Office Viewer
cursor --install-extension cweijan.vscode-office
# o en VS Code:
code --install-extension cweijan.vscode-office

# Stata Viewer
cursor --install-extension diegomenares.stata-viewer

# Stata Enhanced (VSIX local)
cursor --install-extension extensions/stata-enhanced.vsix
```

### Windows (PowerShell)

```powershell
cursor --install-extension cweijan.vscode-office
cursor --install-extension diegomenares.stata-viewer
cursor --install-extension .\extensions\stata-enhanced.vsix
```

> Si `cursor` o `code` no se encuentran en el PATH: en VS Code abre la paleta (`Cmd+Shift+P`) > **Shell Command: Install 'code' command in PATH**. En Cursor: **Shell Command: Install 'cursor' command in PATH**.

---

## Verificar que quedaron instaladas

Abre los archivos de ejemplo en [../resources/](../resources/):

- [sample_paper.pdf](../resources/sample_paper.pdf) → se ve el PDF renderizado (Office Viewer).
- [gdp_data.csv](../resources/gdp_data.csv) → se ve como tabla (Office Viewer).
- [gdp_latam.xlsx](../resources/gdp_latam.xlsx) → se ven las hojas (Office Viewer).
- [reporte_economia.docx](../resources/reporte_economia.docx) → se ve el documento formateado (Office Viewer).
- [gdp_latam.dta](../resources/gdp_latam.dta) → se ven las variables y datos (Stata Viewer).
- [analisis_gdp.do](../resources/analisis_gdp.do) → palabras clave (`clear`, `use`, `regress`) coloreadas (Stata Enhanced).

> Si un archivo no abre con la vista esperada: click derecho > **Reopen Editor With...** y elige el visor correcto.

---

## Problemas comunes

- **No aparece la extension al buscar en Cursor**: probablemente solo esta en VS Code Marketplace y no en Open VSX. Descargala como `.vsix` desde [marketplace.visualstudio.com](https://marketplace.visualstudio.com) e instalala con **Install from VSIX...**.
- **El `.do` no se ve coloreado**: revisa que `kylebarron.stata-enhanced` aparezca en el panel de Extensions, y recarga la ventana (`Cmd+Shift+P` > **Reload Window**).
- **El `.dta` abre como binario**: click derecho > **Reopen Editor With...** > **Stata Viewer**.
