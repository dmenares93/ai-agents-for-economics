# Atajo: ejecutar `.do` en la Interactive Window con `Shift+Enter`

Este "hack" configura un keybinding para que, estando en un archivo `.do` (o `.ado`, `.mata`), al apretar **`Shift+Enter`** la linea/seleccion actual se mande a la **Jupyter Interactive Window** (kernel `nbstata`), igual que se hace con Python en VS Code.

> Asume que ya tienes [`nbstata` instalado](instalar_nbstata.md) y la extension **Jupyter** de Microsoft instalada.

## Por que es util

- No tienes que copiar/pegar al terminal.
- Mantiene **estado** entre lineas (variables, datasets en memoria) porque corre en un kernel persistente.
- Funciona igual que el flujo "Python interactive" al que ya estas acostumbrada/o.

---

## Donde se edita el archivo de keybindings

El archivo es **diferente en Cursor y en VS Code**:

| Editor | macOS | Windows |
|---|---|---|
| **Cursor** | `~/Library/Application Support/Cursor/User/keybindings.json` | `%APPDATA%\Cursor\User\keybindings.json` |
| **VS Code** | `~/Library/Application Support/Code/User/keybindings.json` | `%APPDATA%\Code\User\keybindings.json` |

> En Linux la ruta es `~/.config/Cursor/User/keybindings.json` o `~/.config/Code/User/keybindings.json`.

### Como abrirlo desde la UI

1. Paleta de comandos: `Cmd+Shift+P` (macOS) / `Ctrl+Shift+P` (Windows/Linux).
2. Ejecuta: **Preferences: Open Keyboard Shortcuts (JSON)**.
3. Se abre el `keybindings.json` correcto del editor en el que estes.

---

## El keybinding

Pega esto dentro del array `[ ... ]` del archivo `keybindings.json`:

```json
{
    "key": "shift+enter",
    "command": "jupyter.execSelectionInteractive",
    "when": "editorTextFocus && !editorReadonly && (editorLangId == stata || resourceExtname == .do || resourceExtname == .ado || resourceExtname == .mata)"
}
```

### Que hace cada parte

- `"key": "shift+enter"` — el atajo.
- `"command": "jupyter.execSelectionInteractive"` — comando de la extension Jupyter que manda la seleccion (o linea actual) a la **Interactive Window**.
- `"when": ...` — condicion para que el atajo se active solo en archivos Stata:
  - `editorTextFocus` → estoy escribiendo en el editor.
  - `!editorReadonly` → el archivo no es de solo lectura.
  - `editorLangId == stata` → el editor reconoce el lenguaje como Stata (lo aporta **Stata Enhanced**).
  - `resourceExtname == .do || .ado || .mata` → respaldo por extension del archivo, por si el lenguaje no esta seteado.

---

## Configuracion completa (ejemplo)

Si tu archivo esta vacio o solo tiene `[]`, dejalo asi:

```json
[
    {
        "key": "shift+enter",
        "command": "jupyter.execSelectionInteractive",
        "when": "editorTextFocus && !editorReadonly && (editorLangId == stata || resourceExtname == .do || resourceExtname == .ado || resourceExtname == .mata)"
    },
    {
        "key": "shift+enter",
        "command": "jupyter.execSelectionInteractive",
        "when": "editorTextFocus && editorLangId == 'python' && !findInputFocussed && !replaceInputFocussed"
    },
    {
        "key": "shift+enter",
        "command": "-python.execSelectionInTerminal",
        "when": "editorTextFocus && editorLangId == 'python'"
    }
]
```

- El **segundo** binding hace lo mismo para Python (manda a Interactive Window en vez del terminal).
- El **tercero** (con `-` adelante) **desactiva** el binding por defecto que mandaba Python al terminal — asi `Shift+Enter` en Python tampoco abre el terminal, va siempre a la Interactive Window.

---

## Como usarlo

1. Abre [resources/analisis_gdp.do](../resources/analisis_gdp.do) (o cualquier `.do`).
2. Pon el cursor en una linea (o selecciona varias lineas).
3. Apreta **`Shift+Enter`**.
4. La primera vez se abre la **Interactive Window** y te pide elegir kernel — selecciona **Stata (nbstata)**.
5. La linea se ejecuta en el kernel; el resultado aparece en la ventana interactiva.
6. Siguientes `Shift+Enter` reutilizan la misma sesion: las variables y datasets quedan en memoria.

> Si la primera vez no aparece **Stata (nbstata)** en la lista de kernels, revisa que `nbstata` quedo instalado (ver [instalar_nbstata.md](instalar_nbstata.md)) y reinicia el editor.

---

## Problemas comunes

- **`Shift+Enter` no hace nada**: revisa que la extension **Jupyter** de Microsoft este instalada (`ms-toolsai.jupyter`). El comando `jupyter.execSelectionInteractive` lo aporta ella.
- **`Shift+Enter` me abre el terminal en vez de la Interactive Window** (en Python): te falta el binding con `-python.execSelectionInTerminal` que desactiva el default.
- **No aparece `Stata (nbstata)` como kernel**: corre `jupyter kernelspec list` en terminal — si no aparece `nbstata`, repite el paso de registro en [instalar_nbstata.md](instalar_nbstata.md).
- **Edite el `keybindings.json` equivocado**: recuerda que Cursor y VS Code usan archivos **distintos**. Si editaste el de VS Code y estas trabajando en Cursor (o viceversa), el atajo no aparecera. Usa **Preferences: Open Keyboard Shortcuts (JSON)** desde el editor en el que quieres que funcione.

---

## Adaptarlo a otros lenguajes

El mismo patron sirve para cualquier lenguaje con kernel de Jupyter. Por ejemplo para R:

```json
{
    "key": "shift+enter",
    "command": "jupyter.execSelectionInteractive",
    "when": "editorTextFocus && !editorReadonly && (editorLangId == r || resourceExtname == .R || resourceExtname == .r)"
}
```

Solo cambia `editorLangId` y las extensiones en `resourceExtname`.
