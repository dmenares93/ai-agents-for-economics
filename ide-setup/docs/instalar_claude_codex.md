# Instalar y configurar Claude Code y Codex en VS Code / Cursor

Guía rápida para instalar las extensiones de **Claude Code** (Anthropic) y **Codex** (OpenAI) en tu editor, y dejarlas logeadas desde la propia app.

## Que vamos a instalar

| Extension | Que es | Id |
|---|---|---|
| **Claude Code** | Asistente de Anthropic dentro del editor (terminal + chat) | `anthropic.claude-code` |
| **Codex** | Asistente de OpenAI dentro del editor | `openai.chatgpt` |

---

## 1. Claude Code

### Instalar

**Opcion A — UI**
1. Abre **Extensions** (`Cmd+Shift+X` / `Ctrl+Shift+X`).
2. Busca `Claude Code` (publisher **Anthropic**).
3. Click en **Install**.

**Opcion B — terminal**
```bash
cursor --install-extension anthropic.claude-code
# o en VS Code:
code --install-extension anthropic.claude-code
```

> Si usas Cursor y no aparece en la busqueda, descargala desde [marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code) como `.vsix` e instalala con **Install from VSIX...**.

### Loguearse

1. Abre la paleta de comandos (`Cmd+Shift+P` / `Ctrl+Shift+P`).
2. Ejecuta **Claude: Sign In** (o haz click en el icono de Claude en la barra lateral y luego en **Sign in**).
3. Se abre el navegador en `claude.ai` — autoriza la app con tu cuenta.
4. El navegador redirige de vuelta al editor; veras tu correo en la barra de estado.

> Si tienes plan **Pro / Max**, el login se asocia a ese plan automaticamente. Si usas API key (Anthropic Console), elige **Use API Key** en vez del flujo de navegador.

### Verificar

- Abre el panel de Claude (icono lateral) y escribe `hola`.
- Deberias recibir respuesta del modelo sin errores de autenticacion.

---

## 2. Codex

### Instalar

**Opcion A — UI**
1. Abre **Extensions** (`Cmd+Shift+X`).
2. Busca `ChatGPT - Codex` (publisher **OpenAI**).
3. Click en **Install**.

**Opcion B — terminal**
```bash
cursor --install-extension openai.chatgpt
# o en VS Code:
code --install-extension openai.chatgpt
```

### Loguearse

1. Click en el icono de **Codex / ChatGPT** en la barra lateral.
2. Click en **Sign in with ChatGPT**.
3. Se abre el navegador en `chatgpt.com` — autoriza la app con tu cuenta de OpenAI.
4. El navegador redirige de vuelta al editor; quedas logeado.

> Para usar Codex necesitas una cuenta **ChatGPT Plus / Pro / Team / Enterprise** activa. Si solo tienes API key, configurala en la seccion **API Key** de la extension.

### Verificar

- Abre el panel de Codex y pidele algo simple: `explica este archivo`.
- Si responde, esta listo.

---

## Problemas comunes

- **El login no redirige al editor**: copia manualmente la URL `vscode://...` (o `cursor://...`) que muestra el navegador y pegala en la barra de direcciones del navegador, o usa **Sign in with code** desde la paleta y pega el codigo que da la web.
- **Cursor bloquea el redirect**: en **Settings > Applications**, asegurate que `cursor://` este permitido como protocolo.
- **No aparece la extension en Cursor**: usa el `.vsix` desde el Marketplace de VS Code (Cursor por defecto usa Open VSX, que no las tiene todas).
- **Sesion expirada**: paleta de comandos > **Claude: Sign Out** (o **Codex: Sign Out**) y vuelve a hacer login.

---

## Tip: usar los dos a la vez

Claude Code y Codex pueden convivir sin conflicto — son paneles distintos. Util para comparar respuestas o usar cada uno donde rinde mejor (Claude suele ir mejor para refactors largos, Codex para snippets rapidos).
