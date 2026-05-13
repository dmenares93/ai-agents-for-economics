# Resources — Ejemplos de formatos para VS Code

Carpeta con un archivo de ejemplo por cada formato comun en trabajo de economia / data, para probar extensiones de visualizacion en VS Code / Cursor.

## Archivos incluidos

| Archivo | Formato | Origen | Extension sugerida |
|---|---|---|---|
| [sample_paper.pdf](sample_paper.pdf) | PDF | Paper arXiv (CLIP, Radford et al.) | [Office Viewer](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-office) (`cweijan.vscode-office`) |
| [gdp_data.csv](gdp_data.csv) | CSV | Banco Mundial / datasets/gdp | [Office Viewer](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-office) (`cweijan.vscode-office`) |
| [gdp_latam.xlsx](gdp_latam.xlsx) | Excel | Generado (6 paises LATAM + hoja resumen) | [Office Viewer](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-office) (`cweijan.vscode-office`) |
| [reporte_economia.docx](reporte_economia.docx) | Word | Generado con tabla y secciones | [Office Viewer](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-office) (`cweijan.vscode-office`) |
| [gdp_latam.dta](gdp_latam.dta) | Stata (datos) | Generado desde el CSV (version 118) | [Stata Viewer](https://marketplace.visualstudio.com/items?itemName=diegomenares.stata-viewer) (`diegomenares.stata-viewer`) |
| [analisis_gdp.do](analisis_gdp.do) | Stata do-file | Escrito a mano | [Stata Enhanced](../extensions/stata-enhanced.vsix) (`kylebarron.stata-enhanced`) — VSIX local |

## Como probarlos

1. Abre el panel **Extensions** (`Cmd+Shift+X` en macOS / `Ctrl+Shift+X` en Windows/Linux) e instala la extension correspondiente.
2. Haz click en el archivo desde el explorador.
3. Si no abre con la vista esperada: click derecho > **Reopen Editor With...** y elige el visor.

## Notas sobre los datos

- `gdp_data.csv` contiene series anuales de PIB (US$ corrientes) de todos los paises del Banco Mundial.
- `gdp_latam.xlsx` y `gdp_latam.dta` son subconjuntos con: Chile, Argentina, Brasil, Peru, Mexico, Colombia.
- `analisis_gdp.do` corre sobre `gdp_latam.dta` (calcula crecimiento, regresion y grafico).
