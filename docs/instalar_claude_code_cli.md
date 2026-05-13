# Instalar Claude Code (CLI) y ejecutarlo en el terminal de VS Code / Cursor

`claude-code` es la CLI oficial de Anthropic para usar Claude desde la terminal. Esta guia instala la CLI en macOS, Linux y Windows, y muestra como ejecutarla dentro del **terminal integrado** de VS Code o Cursor sobre este proyecto.

## Requisitos previos

- **Node.js 18+** instalado (la CLI corre sobre Node).
  - Verifica con: `node --version`.
- Cuenta de Anthropic activa (Claude Pro / Max) o **API key** de la [Console](https://console.anthropic.com).

---

## macOS

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

---

## Linux (Ubuntu / Debian)

```bash
# 1. Instalar Node 20 LTS
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# 2. Instalar Claude Code globalmente
npm install -g @anthropic-ai/claude-code

# 3. Verificar
claude --version
```

> En Fedora/Arch reemplaza el paso 1 por el gestor de paquetes correspondiente (`dnf install nodejs`, `pacman -S nodejs npm`, etc.).

---

## Windows

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

---

## Primer login

La primera vez que ejecutes `claude` te pedira autenticarte:

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

Para cerrar sesion: `claude logout`.

---

## Ejecutar Claude Code en el terminal de VS Code / Cursor

1. Abre el proyecto en el editor:
   ```bash
   cursor ~/IA_Agentes_Economia
   # o
   code ~/IA_Agentes_Economia
   ```
2. Abre el **terminal integrado**: `Ctrl+ñ` (macOS: `Ctrl+\`` ) o menu **Terminal > New Terminal**.
3. Verifica que estas en la carpeta del proyecto:
   ```bash
   pwd
   # /Users/<tu-usuario>/IA_Agentes_Economia
   ```
4. Lanza Claude Code:
   ```bash
   claude
   ```
5. Te aparece el prompt interactivo. Prueba con:
   ```
   > resume que hay en resources/
   ```

> Claude usa el **working directory** del terminal como contexto. Si abres el terminal dentro de `IA_Agentes_Economia`, vera todos los archivos del proyecto.

### Comandos utiles dentro de Claude

| Comando | Que hace |
|---|---|
| `/help` | Lista todos los comandos disponibles |
| `/clear` | Limpia la conversacion actual |
| `/init` | Crea un `CLAUDE.md` con documentacion del repo |
| `/review` | Hace code review de los cambios pendientes |
| `/cost` | Muestra el costo acumulado de la sesion |
| `exit` o `Ctrl+D` | Salir |

### Modo "one-shot" (sin entrar al prompt)

```bash
# Pregunta y respuesta sin entrar al modo interactivo
claude -p "que archivos hay en resources/?"

# Leer desde stdin
cat resources/analisis_gdp.do | claude -p "explica este script"
```

---

## Verificar la instalacion sobre este proyecto

Dentro del terminal del editor, parado en `IA_Agentes_Economia`:

```bash
claude -p "lista los archivos en resources/ y dime que formato es cada uno"
```

Si responde con la lista (PDF, CSV, XLSX, DOCX, DTA, DO), todo esta correctamente configurado.

---

## Problemas comunes

- **`claude: command not found`**: el `bin` de npm global no esta en el PATH. Ejecuta `npm config get prefix` y agrega `<prefix>/bin` a tu PATH.
- **Error de permisos en `npm install -g`** (macOS/Linux): no uses `sudo`. Configura un prefijo de usuario (ver nota en seccion macOS).
- **El terminal de Cursor no encuentra `claude`** aunque funciona fuera: cierra y vuelve a abrir la ventana del editor para que recargue el PATH, o reinicia Cursor.
- **Login no redirige**: copia el codigo que muestra el navegador y pegalo en la terminal cuando lo pida.
- **Quota / rate limit**: revisa tu plan en [console.anthropic.com](https://console.anthropic.com) o ejecuta `/cost` dentro de Claude.

---

## Actualizar / desinstalar

```bash
# Actualizar a la ultima version
npm update -g @anthropic-ai/claude-code

# Desinstalar
npm uninstall -g @anthropic-ai/claude-code
```
