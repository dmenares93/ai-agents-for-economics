# Extensions locales

Extensiones VS Code / Cursor que **no estan disponibles en Open VSX** (registry que usa Cursor por defecto) y por eso se distribuyen aqui como `.vsix` para instalacion manual.

## Archivos

| Archivo | Que es | Origen |
|---|---|---|
| [stata-enhanced.vsix](stata-enhanced.vsix) | Stata Enhanced (Kyle Barron) — syntax highlighting para `.do` / `.ado` / dyndoc | VS Code Marketplace |

## Como instalar en Cursor (o VS Code)

### Opcion A — desde la UI
1. Abre el panel **Extensions** (`Cmd+Shift+X`).
2. Click en el icono `...` arriba del panel.
3. **Install from VSIX...**
4. Selecciona el archivo `.vsix` de esta carpeta.
5. Recarga la ventana cuando lo pida.

### Opcion B — desde terminal
```bash
cursor --install-extension extensions/stata-enhanced.vsix
# o en VS Code:
code --install-extension extensions/stata-enhanced.vsix
```

## Verificar que quedo instalada

Abre [../resources/analisis_gdp.do](../resources/analisis_gdp.do) — deberias ver palabras clave (`clear`, `use`, `regress`, `twoway`) coloreadas.
