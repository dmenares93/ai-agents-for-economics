# Instalar Cursor o VS Code en Windows / macOS

Guia rapida para instalar **Cursor** (editor con IA integrada, fork de VS Code) o **Visual Studio Code** en Windows y macOS, con los links oficiales para descargar los instaladores.

## Cual elegir

| Editor | Para que sirve | Cuando usarlo |
|---|---|---|
| **Cursor** | VS Code con IA integrada nativamente (chat, autocompletado, agentes) | Si tu flujo es principalmente con IA (Claude, GPT). Trae todo preconfigurado. |
| **VS Code** | Editor base de Microsoft, abierto y extensible | Si prefieres el ecosistema clasico, o necesitas extensiones que solo estan en el Marketplace de Microsoft. |

> Cursor es un **fork de VS Code**, asi que se ve y funciona casi igual. Las configuraciones y muchas extensiones son compatibles entre los dos.

---

## Cursor

### Link oficial de descarga

**https://cursor.com/download** (detecta tu sistema automaticamente)

### macOS

1. Entra a [cursor.com/download](https://cursor.com/download).
2. Descarga el `.dmg` (elige **Apple Silicon** para M1/M2/M3/M4, o **Intel** para Macs antiguos).
3. Abre el `.dmg` y arrastra **Cursor** a la carpeta **Applications**.
4. Lanza Cursor desde Launchpad o Spotlight (`Cmd+Space` > "Cursor").
5. En el primer arranque, macOS puede preguntar si confias en la app — click **Open**.

> Para saber tu arquitectura: menu Apple > **Acerca de este Mac**. Si dice "Chip Apple M...", usa Apple Silicon.

### Windows

1. Entra a [cursor.com/download](https://cursor.com/download).
2. Descarga el `.exe` (User Installer).
3. Ejecuta el instalador y sigue los pasos (acepta los defaults).
4. Lanza Cursor desde el menu Inicio.

### Habilitar el comando `cursor` en terminal

Una vez abierto Cursor:
1. Abre la paleta de comandos: `Cmd+Shift+P` (macOS) o `Ctrl+Shift+P` (Windows).
2. Ejecuta: **Shell Command: Install 'cursor' command in PATH**.
3. Reinicia el terminal y prueba:
   ```bash
   cursor --version
   ```

---

## Visual Studio Code

### Link oficial de descarga

**https://code.visualstudio.com/download**

### macOS

1. Entra a [code.visualstudio.com/download](https://code.visualstudio.com/download).
2. Click en **Mac** (descarga un `.zip` universal — funciona en Intel y Apple Silicon).
3. Descomprime el `.zip` y arrastra **Visual Studio Code** a la carpeta **Applications**.
4. Lanza desde Launchpad o Spotlight (`Cmd+Space` > "Visual Studio Code").

### Windows

1. Entra a [code.visualstudio.com/download](https://code.visualstudio.com/download).
2. Click en **Windows** > **User Installer** (recomendado — no requiere admin).
3. Ejecuta el `.exe` y sigue los pasos. Marca la casilla **Add to PATH** durante la instalacion.
4. Lanza VS Code desde el menu Inicio.

> Alternativa en Windows con winget:
> ```powershell
> winget install Microsoft.VisualStudioCode
> ```

### Habilitar el comando `code` en terminal

**macOS:**
1. Abre VS Code.
2. Paleta de comandos: `Cmd+Shift+P`.
3. Ejecuta: **Shell Command: Install 'code' command in PATH**.
4. Reinicia el terminal y prueba `code --version`.

**Windows:** ya queda disponible si marcaste **Add to PATH** durante la instalacion.

---

## Abrir este proyecto desde el editor

Una vez instalado, desde el terminal:

```bash
# Con Cursor
cursor ~/IA_Agentes_Economia

# Con VS Code
code ~/IA_Agentes_Economia
```

O desde la UI: **File > Open Folder...** y elige la carpeta del proyecto.

---

## Siguiente paso

Ya con el editor instalado, sigue las otras guias de este repo:

- [Instalar las extensiones del proyecto](instalar_extensiones.md) (Office Viewer, Stata Viewer, Stata Enhanced)
- [Instalar Claude Code y Codex como extensiones](instalar_claude_codex.md)
- [Instalar la CLI de Claude Code y usarla en el terminal](instalar_claude_code_cli.md)
- [Instalar `nbstata` para correr Stata en notebooks](instalar_nbstata.md)

---

## Problemas comunes

- **macOS bloquea la app por "desarrollador no identificado"**: click derecho sobre el icono > **Open** > **Open** (solo la primera vez).
- **Windows: el instalador pide permisos de admin y no los tienes**: usa el **User Installer** (no el System Installer), que instala solo para tu usuario.
- **`cursor` o `code` no se reconoce en el terminal**: revisa que ejecutaste **Shell Command: Install 'X' command in PATH** desde la paleta, y reinicia el terminal.
