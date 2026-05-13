# Workflow — VS Code / Cursor + agentes de IA para Stata

Flujo de trabajo para economistas: editor, agentes (Claude Code, Codex), extensiones y atajos pensados para investigación, programación y análisis de datos con **Stata**.

La guía está pensada para leerse de corrido, en este orden:

1. [Instalar el editor (Cursor o VS Code)](#1-instalar-el-editor-cursor-o-vs-code)
2. [Instalar las extensiones del proyecto](#2-instalar-las-extensiones-del-proyecto)
3. [Instalar Claude Code y Codex como extensiones](#3-instalar-claude-code-y-codex-como-extensiones)
4. [Instalar Claude Code CLI](#4-instalar-claude-code-cli)
5. [Instalar `nbstata` (kernel de Stata para Jupyter)](#5-instalar-nbstata-kernel-de-stata-para-jupyter)
6. [Atajo: ejecutar `.do` con `Shift+Enter` en la Interactive Window](#6-atajo-ejecutar-do-con-shiftenter-en-la-interactive-window)

Recursos:

- [extensions/](extensions/) — Archivos `.vsix` para extensiones no disponibles en Open VSX (instalación manual en Cursor).
- [resources/](resources/) — Archivos de ejemplo (PDF, CSV, XLSX, DOCX, `.dta`, `.do`) para probar las extensiones de visualización.

---

## 1. Instalar el editor (Cursor o VS Code)

Guía rápida para instalar **Cursor** (editor con IA integrada, fork de VS Code) o **Visual Studio Code** en Windows y macOS.

### Cuál elegir

| Editor | Para qué sirve | Cuándo usarlo |
|---|---|---|
| **Cursor** | VS Code con IA integrada nativamente (chat, autocompletado, agentes) | Si tu flujo es principalmente con IA (Claude, GPT). Trae todo preconfigurado. |
| **VS Code** | Editor base de Microsoft, abierto y extensible | Si prefieres el ecosistema clásico, o necesitas extensiones que solo están en el Marketplace de Microsoft. |

> Cursor es un **fork de VS Code**, así que se ve y funciona casi igual. Las configuraciones y muchas extensiones son compatibles entre los dos.

### Cursor

Link oficial de descarga: **https://cursor.com/download** (detecta tu sistema automáticamente)

**macOS**

1. Entra a [cursor.com/download](https://cursor.com/download).
2. Descarga el `.dmg` (elige **Apple Silicon** para M1/M2/M3/M4, o **Intel** para Macs antiguos).
3. Abre el `.dmg` y arrastra **Cursor** a la carpeta **Applications**.
4. Lanza Cursor desde Launchpad o Spotlight (`Cmd+Space` > "Cursor").
5. En el primer arranque, macOS puede preguntar si confías en la app — click **Open**.

> Para saber tu arquitectura: menú Apple > **Acerca de este Mac**. Si dice "Chip Apple M...", usa Apple Silicon.

**Windows**

1. Entra a [cursor.com/download](https://cursor.com/download).
2. Descarga el `.exe` (User Installer).
3. Ejecuta el instalador y sigue los pasos (acepta los defaults).
4. Lanza Cursor desde el menú Inicio.

**Habilitar el comando `cursor` en terminal**

1. Abre la paleta de comandos: `Cmd+Shift+P` (macOS) o `Ctrl+Shift+P` (Windows).
2. Ejecuta: **Shell Command: Install 'cursor' command in PATH**.
3. Reinicia el terminal y prueba `cursor --version`.

### Visual Studio Code

Link oficial de descarga: **https://code.visualstudio.com/download**

**macOS**

1. Entra a [code.visualstudio.com/download](https://code.visualstudio.com/download).
2. Click en **Mac** (descarga un `.zip` universal — funciona en Intel y Apple Silicon).
3. Descomprime el `.zip` y arrastra **Visual Studio Code** a la carpeta **Applications**.
4. Lanza desde Launchpad o Spotlight (`Cmd+Space` > "Visual Studio Code").

**Windows**

1. Entra a [code.visualstudio.com/download](https://code.visualstudio.com/download).
2. Click en **Windows** > **User Installer** (recomendado — no requiere admin).
3. Ejecuta el `.exe` y sigue los pasos. Marca la casilla **Add to PATH** durante la instalación.
4. Lanza VS Code desde el menú Inicio.

> Alternativa en Windows con winget:
> ```powershell
> winget install Microsoft.VisualStudioCode
> ```

**Habilitar el comando `code` en terminal**

- **macOS:** abre VS Code, paleta de comandos (`Cmd+Shift+P`) > **Shell Command: Install 'code' command in PATH**. Reinicia el terminal y prueba `code --version`.
- **Windows:** ya queda disponible si marcaste **Add to PATH** durante la instalación.

### Abrir este proyecto desde el editor

```bash
# Con Cursor
cursor ~/IA_Agentes_Economia

# Con VS Code
code ~/IA_Agentes_Economia
```

O desde la UI: **File > Open Folder...** y elige la carpeta del proyecto.

### Problemas comunes

- **macOS bloquea la app por "desarrollador no identificado"**: click derecho sobre el icono > **Open** > **Open** (solo la primera vez).
- **Windows: el instalador pide permisos de admin y no los tienes**: usa el **User Installer** (no el System Installer), que instala solo para tu usuario.
- **`cursor` o `code` no se reconoce en el terminal**: revisa que ejecutaste **Shell Command: Install 'X' command in PATH** desde la paleta, y reinicia el terminal.

---

## 2. Instalar las extensiones del proyecto

Extensiones que usamos para visualizar PDF, CSV, Excel, Word, Stata (`.dta`) y resaltar sintaxis de `.do` files.

### Qué vamos a instalar

| Extensión | Para qué sirve | Cómo se instala |
|---|---|---|
| **Office Viewer** (`cweijan.vscode-office`) | Ver PDF, CSV, XLSX y DOCX dentro del editor | Marketplace (UI o terminal) |
| **Stata Viewer** (`diegomenares.stata-viewer`) | Previsualizar archivos `.dta` (Stata) | Marketplace (UI o terminal) |
| **Stata Enhanced** (`kylebarron.stata-enhanced`) | Syntax highlighting para `.do` / `.ado` | VSIX local (no está en Open VSX) |

> Cursor usa **Open VSX** por defecto, que tiene menos extensiones que el Marketplace de VS Code. Las que existen en ambos se instalan igual; las que no, se distribuyen como `.vsix` en [extensions/](extensions/).

### Opción A — desde la UI (recomendada)

1. Abre el panel **Extensions** (`Cmd+Shift+X` en macOS / `Ctrl+Shift+X` en Windows/Linux).
2. Busca por el **id** de la extensión (ej: `cweijan.vscode-office`) y click en **Install**.
3. Para la extensión que viene como `.vsix`:
   - Click en el icono `...` arriba del panel de Extensions.
   - **Install from VSIX...**
   - Selecciona [extensions/stata-enhanced.vsix](extensions/stata-enhanced.vsix).
4. Recarga la ventana si lo pide.

### Opción B — desde terminal

**macOS / Linux**

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

**Windows (PowerShell)**

```powershell
cursor --install-extension cweijan.vscode-office
cursor --install-extension diegomenares.stata-viewer
cursor --install-extension .\extensions\stata-enhanced.vsix
```

> Si `cursor` o `code` no se encuentran en el PATH: ver sección 1 (habilitar el comando en terminal).

### Verificar que quedaron instaladas

Abre los archivos de ejemplo en [resources/](resources/):

- [sample_paper.pdf](resources/sample_paper.pdf) → se ve el PDF renderizado (Office Viewer).
- [gdp_data.csv](resources/gdp_data.csv) → se ve como tabla (Office Viewer).
- [gdp_latam.xlsx](resources/gdp_latam.xlsx) → se ven las hojas (Office Viewer).
- [reporte_economia.docx](resources/reporte_economia.docx) → se ve el documento formateado (Office Viewer).
- [gdp_latam.dta](resources/gdp_latam.dta) → se ven las variables y datos (Stata Viewer).
- [analisis_gdp.do](resources/analisis_gdp.do) → palabras clave (`clear`, `use`, `regress`) coloreadas (Stata Enhanced).

> Si un archivo no abre con la vista esperada: click derecho > **Reopen Editor With...** y elige el visor correcto.

### Problemas comunes

- **No aparece la extensión al buscar en Cursor**: probablemente solo está en VS Code Marketplace y no en Open VSX. Descárgala como `.vsix` desde [marketplace.visualstudio.com](https://marketplace.visualstudio.com) e instálala con **Install from VSIX...**.
- **El `.do` no se ve coloreado**: revisa que `kylebarron.stata-enhanced` aparezca en el panel de Extensions, y recarga la ventana (`Cmd+Shift+P` > **Reload Window**).
- **El `.dta` abre como binario**: click derecho > **Reopen Editor With...** > **Stata Viewer**.

---

## 3. Instalar Claude Code y Codex como extensiones

Extensiones de **Claude Code** (Anthropic) y **Codex** (OpenAI) en tu editor, con login desde la propia app.

| Extensión | Qué es | Id |
|---|---|---|
| **Claude Code** | Asistente de Anthropic dentro del editor (terminal + chat) | `anthropic.claude-code` |
| **Codex** | Asistente de OpenAI dentro del editor | `openai.chatgpt` |

### Claude Code

**Instalar (UI):** Extensions (`Cmd+Shift+X`) > busca `Claude Code` (publisher **Anthropic**) > **Install**.

**Instalar (terminal):**

```bash
cursor --install-extension anthropic.claude-code
# o en VS Code:
code --install-extension anthropic.claude-code
```

> Si usas Cursor y no aparece en la búsqueda, descárgala desde [marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code) como `.vsix` e instálala con **Install from VSIX...**.

**Loguearse:**

1. Paleta de comandos (`Cmd+Shift+P` / `Ctrl+Shift+P`).
2. Ejecuta **Claude: Sign In** (o click en el icono de Claude en la barra lateral y **Sign in**).
3. Se abre el navegador en `claude.ai` — autoriza la app con tu cuenta.
4. El navegador redirige de vuelta al editor; verás tu correo en la barra de estado.

> Si tienes plan **Pro / Max**, el login se asocia a ese plan automáticamente. Si usas API key (Anthropic Console), elige **Use API Key** en vez del flujo de navegador.

**Verificar:** abre el panel de Claude (icono lateral) y escribe `hola`. Deberías recibir respuesta sin errores.

### Codex

**Instalar (UI):** Extensions > busca `ChatGPT - Codex` (publisher **OpenAI**) > **Install**.

**Instalar (terminal):**

```bash
cursor --install-extension openai.chatgpt
# o en VS Code:
code --install-extension openai.chatgpt
```

**Loguearse:**

1. Click en el icono de **Codex / ChatGPT** en la barra lateral.
2. Click en **Sign in with ChatGPT**.
3. Se abre el navegador en `chatgpt.com` — autoriza la app con tu cuenta de OpenAI.
4. El navegador redirige de vuelta al editor; quedas logeado.

> Para usar Codex necesitas una cuenta **ChatGPT Plus / Pro / Team / Enterprise** activa. Si solo tienes API key, configúrala en la sección **API Key** de la extensión.

**Verificar:** abre el panel de Codex y pídele algo simple: `explica este archivo`.

### Problemas comunes

- **El login no redirige al editor**: copia manualmente la URL `vscode://...` (o `cursor://...`) que muestra el navegador y pégala en la barra de direcciones, o usa **Sign in with code** desde la paleta y pega el código que da la web.
- **Cursor bloquea el redirect**: en **Settings > Applications**, asegúrate que `cursor://` esté permitido como protocolo.
- **No aparece la extensión en Cursor**: usa el `.vsix` desde el Marketplace de VS Code (Cursor por defecto usa Open VSX, que no las tiene todas).
- **Sesión expirada**: paleta de comandos > **Claude: Sign Out** (o **Codex: Sign Out**) y vuelve a hacer login.

### Tip: usar los dos a la vez

Claude Code y Codex pueden convivir sin conflicto — son paneles distintos. Útil para comparar respuestas o usar cada uno donde rinde mejor (Claude suele ir mejor para refactors largos, Codex para snippets rápidos).

---

## 4. Instalar Claude Code CLI

`claude-code` es la CLI oficial de Anthropic para usar Claude desde la terminal. Esta sección instala la CLI en macOS, Linux y Windows, y muestra cómo ejecutarla dentro del **terminal integrado** de VS Code o Cursor sobre este proyecto.

### Requisitos previos

- **Node.js 18+** instalado (la CLI corre sobre Node). Verifica con `node --version`.
- Cuenta de Anthropic activa (Claude Pro / Max) o **API key** de la [Console](https://console.anthropic.com).

### macOS

```bash
# 1. Instalar Node si no lo tienes (con Homebrew)
brew install node

# 2. Instalar Claude Code globalmente
npm install -g @anthropic-ai/claude-code

# 3. Verificar
claude --version
```

> Si `npm install -g` pide permisos de root, configura un prefijo de usuario:
> ```bash
> mkdir -p ~/.npm-global
> npm config set prefix ~/.npm-global
> echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.zshrc
> source ~/.zshrc
> ```

### Linux (Ubuntu / Debian)

```bash
# 1. Instalar Node 20 LTS
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# 2. Instalar Claude Code globalmente
npm install -g @anthropic-ai/claude-code

# 3. Verificar
claude --version
```

> En Fedora/Arch reemplaza el paso 1 por el gestor correspondiente (`dnf install nodejs`, `pacman -S nodejs npm`, etc.).

### Windows

Usa **PowerShell** (no CMD).

```powershell
# 1. Instalar Node con winget
winget install OpenJS.NodeJS.LTS

# Cierra y reabre PowerShell para refrescar el PATH

# 2. Instalar Claude Code globalmente
npm install -g @anthropic-ai/claude-code

# 3. Verificar
claude --version
```

> Alternativa: instalar Node desde [nodejs.org](https://nodejs.org) (LTS).

### Primer login

```bash
claude
```

1. Se abre el navegador en `claude.ai`.
2. Autoriza la app con tu cuenta.
3. El navegador redirige de vuelta a la terminal — quedas logeado.

> Si prefieres usar **API key** en vez del flujo de navegador:
> ```bash
> export ANTHROPIC_API_KEY=sk-ant-...
> ```
> (en Windows PowerShell: `$env:ANTHROPIC_API_KEY = "sk-ant-..."`)

Para cerrar sesión: `claude logout`.

### Ejecutar Claude Code en el terminal de VS Code / Cursor

1. Abre el proyecto en el editor:
   ```bash
   cursor ~/IA_Agentes_Economia
   # o
   code ~/IA_Agentes_Economia
   ```
2. Abre el **terminal integrado**: `` Ctrl+` `` o menú **Terminal > New Terminal**.
3. Verifica el directorio:
   ```bash
   pwd
   # /Users/<tu-usuario>/IA_Agentes_Economia
   ```
4. Lanza Claude Code:
   ```bash
   claude
   ```
5. Prueba con:
   ```
   > resume que hay en resources/
   ```

> Claude usa el **working directory** del terminal como contexto. Si abres el terminal dentro de `IA_Agentes_Economia`, verá todos los archivos del proyecto.

### Comandos útiles dentro de Claude

| Comando | Qué hace |
|---|---|
| `/help` | Lista todos los comandos disponibles |
| `/clear` | Limpia la conversación actual |
| `/init` | Crea un `CLAUDE.md` con documentación del repo |
| `/review` | Hace code review de los cambios pendientes |
| `/cost` | Muestra el costo acumulado de la sesión |
| `exit` o `Ctrl+D` | Salir |

### Modo "one-shot" (sin entrar al prompt)

```bash
# Pregunta y respuesta sin entrar al modo interactivo
claude -p "que archivos hay en resources/?"

# Leer desde stdin
cat resources/analisis_gdp.do | claude -p "explica este script"
```

### Verificar la instalación sobre este proyecto

```bash
claude -p "lista los archivos en resources/ y dime que formato es cada uno"
```

Si responde con la lista (PDF, CSV, XLSX, DOCX, DTA, DO), todo está correctamente configurado.

### Problemas comunes

- **`claude: command not found`**: el `bin` de npm global no está en el PATH. Ejecuta `npm config get prefix` y agrega `<prefix>/bin` a tu PATH.
- **Error de permisos en `npm install -g`** (macOS/Linux): no uses `sudo`. Configura un prefijo de usuario (ver sección macOS).
- **El terminal de Cursor no encuentra `claude`** aunque funciona fuera: cierra y vuelve a abrir la ventana del editor para que recargue el PATH, o reinicia Cursor.
- **Login no redirige**: copia el código que muestra el navegador y pégalo en la terminal cuando lo pida.
- **Quota / rate limit**: revisa tu plan en [console.anthropic.com](https://console.anthropic.com) o ejecuta `/cost` dentro de Claude.

### Actualizar / desinstalar

```bash
# Actualizar a la última versión
npm update -g @anthropic-ai/claude-code

# Desinstalar
npm uninstall -g @anthropic-ai/claude-code
```

---

## 5. Instalar `nbstata` (kernel de Stata para Jupyter)

`nbstata` es el kernel de Jupyter que permite ejecutar código **Stata** dentro de notebooks. Esta sección instala `nbstata` y `JupyterLab` de forma **aislada pero global al usuario** usando `pipx`, evitando contaminar el Python del sistema o de proyectos específicos.

### Requisitos previos

- **Stata 17 o superior** instalado localmente (incluye `pystata`, la librería que `nbstata` usa internamente).
- **Python 3.9+** disponible en el sistema.
- Saber qué **edición** de Stata tienes (`be`, `se` o `mp`).

> Antes de empezar, si tu prompt muestra `(nombre-env)`, sal del entorno virtual con `deactivate` (o `conda deactivate` si es conda).

### macOS

```bash
# 1. Instalar pipx
brew install pipx

# 2. Asegurar que pipx esté en tu PATH
pipx ensurepath
```

**Cierra y reabre la terminal** para que el PATH se actualice. Luego:

```bash
# 3. Instalar JupyterLab aislado con pipx
pipx install jupyterlab

# 4. Inyectar nbstata en el mismo venv de jupyterlab
pipx inject jupyterlab nbstata

# 5. Registrar el kernel de Stata en Jupyter (a nivel de usuario)
~/.local/pipx/venvs/jupyterlab/bin/python -m nbstata.install --user
```

> Importante: usar `--user` registra el kernel en `~/Library/Jupyter/kernels/`, que es la ubicación que **VS Code** consulta. Con `--sys-prefix` el kernel queda dentro del venv de pipx y no aparece en el selector de VS Code.

Configuración de Stata (`~/.config/nbstata/nbstata.conf`):

```ini
[nbstata]
stata_dir = /Applications/Stata
edition = se
```

### Linux (Ubuntu / Debian)

```bash
# 1. Instalar pipx
sudo apt update
sudo apt install -y pipx

# 2. Asegurar que pipx esté en tu PATH
pipx ensurepath
```

**Cierra y reabre la terminal** (o ejecuta `source ~/.bashrc`). Luego:

```bash
# 3. Instalar JupyterLab aislado con pipx
pipx install jupyterlab

# 4. Inyectar nbstata en el mismo venv de jupyterlab
pipx inject jupyterlab nbstata

# 5. Registrar el kernel de Stata en Jupyter (a nivel de usuario)
~/.local/pipx/venvs/jupyterlab/bin/python -m nbstata.install --user
```

> En otras distribuciones (Fedora, Arch, etc.) reemplaza `apt install pipx` por el gestor de paquetes correspondiente, o instálalo con `python3 -m pip install --user pipx`.

Configuración de Stata (`~/.config/nbstata/nbstata.conf`):

```ini
[nbstata]
stata_dir = /usr/local/stata18
edition = mp
```

Ajusta `stata_dir` a la ruta real de tu instalación (típicamente `/usr/local/stata17`, `/usr/local/stata18`, etc.).

### Windows

En Windows se recomienda usar **PowerShell**.

```powershell
# 1. Instalar pipx (necesita Python 3.9+ instalado desde python.org o Microsoft Store)
python -m pip install --user pipx

# 2. Asegurar que pipx esté en tu PATH
python -m pipx ensurepath
```

**Cierra y reabre PowerShell** para que el PATH se actualice. Luego:

```powershell
# 3. Instalar JupyterLab aislado con pipx
pipx install jupyterlab

# 4. Inyectar nbstata en el mismo venv de jupyterlab
pipx inject jupyterlab nbstata

# 5. Registrar el kernel de Stata en Jupyter (a nivel de usuario)
& "$env:USERPROFILE\.local\pipx\venvs\jupyterlab\Scripts\python.exe" -m nbstata.install --user
```

Configuración de Stata (`%APPDATA%\nbstata\nbstata.conf`):

```ini
[nbstata]
stata_dir = C:\Program Files\Stata18
edition = se
```

### Verificar la instalación

```bash
jupyter kernelspec list
```

Deberías ver una línea como:

```
nbstata    /home/usuario/.local/share/jupyter/kernels/nbstata
```

Lanza JupyterLab:

```bash
jupyter lab
```

Crea un notebook nuevo y elige el kernel **Stata (nbstata)**. Prueba con:

```stata
display "hola desde Stata"
sysuse auto, clear
summarize
```

### Mantenimiento

```bash
# Actualizar JupyterLab y nbstata
pipx upgrade jupyterlab
pipx runpip jupyterlab install --upgrade nbstata

# Desinstalar todo (limpio)
jupyter kernelspec uninstall nbstata
pipx uninstall jupyterlab
```

### Por qué `pipx` y no `pip` global

- **Aislado**: `pipx` crea un venv dedicado por herramienta, sin contaminar el Python del sistema ni el de tus proyectos.
- **Global al usuario**: los comandos (`jupyter`, `jupyter lab`) quedan disponibles desde cualquier carpeta.
- **Reproducible**: si algo se rompe, basta con `pipx uninstall jupyterlab` y volver a instalar — no toca nada más.
- **Mejor que el Python del sistema**: en macOS/Linux, el Python preinstalado es para uso interno del SO; mezclar paquetes ahí causa problemas de permisos y rompe dependencias del sistema.

---

## 6. Atajo: ejecutar `.do` con `Shift+Enter` en la Interactive Window

Este "hack" configura un keybinding para que, estando en un archivo `.do` (o `.ado`, `.mata`), al apretar **`Shift+Enter`** la línea/selección actual se mande a la **Jupyter Interactive Window** (kernel `nbstata`), permitiendo ejecución interactiva línea a línea.

> Asume que ya tienes `nbstata` instalado (sección 5) y la extensión **Jupyter** de Microsoft instalada.

### Por qué es útil

- No tienes que copiar/pegar al terminal.
- Mantiene **estado** entre líneas (variables, datasets en memoria) porque corre en un kernel persistente.
- Permite iterar línea a línea como en un entorno interactivo.

### Dónde se edita el archivo de keybindings

El archivo es **diferente en Cursor y en VS Code**:

| Editor | macOS | Windows |
|---|---|---|
| **Cursor** | `~/Library/Application Support/Cursor/User/keybindings.json` | `%APPDATA%\Cursor\User\keybindings.json` |
| **VS Code** | `~/Library/Application Support/Code/User/keybindings.json` | `%APPDATA%\Code\User\keybindings.json` |

> En Linux la ruta es `~/.config/Cursor/User/keybindings.json` o `~/.config/Code/User/keybindings.json`.

**Cómo abrirlo desde la UI:**

1. Paleta de comandos: `Cmd+Shift+P` (macOS) / `Ctrl+Shift+P` (Windows/Linux).
2. Ejecuta: **Preferences: Open Keyboard Shortcuts (JSON)**.
3. Se abre el `keybindings.json` correcto del editor en el que estés.

### El keybinding

Pega esto dentro del array `[ ... ]` del archivo `keybindings.json`:

```json
{
    "key": "shift+enter",
    "command": "jupyter.execSelectionInteractive",
    "when": "editorTextFocus && !editorReadonly && (editorLangId == stata || resourceExtname == .do || resourceExtname == .ado || resourceExtname == .mata)"
}
```

**Qué hace cada parte:**

- `"key": "shift+enter"` — el atajo.
- `"command": "jupyter.execSelectionInteractive"` — comando de la extensión Jupyter que manda la selección (o línea actual) a la **Interactive Window**.
- `"when": ...` — condición para que el atajo se active solo en archivos Stata:
  - `editorTextFocus` → estoy escribiendo en el editor.
  - `!editorReadonly` → el archivo no es de solo lectura.
  - `editorLangId == stata` → el editor reconoce el lenguaje como Stata (lo aporta **Stata Enhanced**).
  - `resourceExtname == .do || .ado || .mata` → respaldo por extensión del archivo, por si el lenguaje no está seteado.

### Cómo usarlo

1. Abre [resources/analisis_gdp.do](resources/analisis_gdp.do) (o cualquier `.do`).
2. Pon el cursor en una línea (o selecciona varias líneas).
3. Apreta **`Shift+Enter`**.
4. La primera vez se abre la **Interactive Window** y te pide elegir kernel — selecciona **Stata (nbstata)**.
5. La línea se ejecuta en el kernel; el resultado aparece en la ventana interactiva.
6. Siguientes `Shift+Enter` reutilizan la misma sesión: las variables y datasets quedan en memoria.

> Si la primera vez no aparece **Stata (nbstata)** en la lista de kernels, revisa que `nbstata` quedó instalado (sección 5) y reinicia el editor.

### Problemas comunes

- **`Shift+Enter` no hace nada**: revisa que la extensión **Jupyter** de Microsoft esté instalada (`ms-toolsai.jupyter`). El comando `jupyter.execSelectionInteractive` lo aporta ella.
- **No aparece `Stata (nbstata)` como kernel**: corre `jupyter kernelspec list` en terminal — si no aparece `nbstata`, repite el paso de registro de la sección 5.
- **Edité el `keybindings.json` equivocado**: recuerda que Cursor y VS Code usan archivos **distintos**. Si editaste el de VS Code y estás trabajando en Cursor (o viceversa), el atajo no aparecerá. Usa **Preferences: Open Keyboard Shortcuts (JSON)** desde el editor en el que quieres que funcione.
