# Instalar `nbstata` (Kernel de Stata para Jupyter) con `pipx`

`nbstata` es el kernel de Jupyter que permite ejecutar código **Stata** dentro de notebooks. Esta guía instala `nbstata` y `JupyterLab` de forma **aislada pero global al usuario** usando `pipx`, evitando contaminar el Python del sistema o de proyectos específicos.

## Requisitos previos

- **Stata 17 o superior** instalado localmente (incluye `pystata`, la librería que `nbstata` usa internamente).
- **Python 3.9+** disponible en el sistema.
- Saber qué **edición** de Stata tienes (`be`, `se` o `mp`).

> Antes de empezar, si tu prompt muestra `(nombre-env)`, sal del entorno virtual con `deactivate` (o `conda deactivate` si es conda).

---

## macOS

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

> Importante: usar `--user` registra el kernel en `~/Library/Jupyter/kernels/`, que es la ubicación que **VSCode** consulta. Con `--sys-prefix` el kernel queda dentro del venv de pipx y no aparece en el selector de VSCode.

Configuración de Stata (`~/.config/nbstata/nbstata.conf`):

```ini
[nbstata]
stata_dir = /Applications/Stata
edition = se
```

---

## Linux (Ubuntu / Debian)

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

---

## Windows

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

---

## Verificar la instalación

En cualquier sistema, comprueba que el kernel quedó registrado:

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

---

## Mantenimiento

```bash
# Actualizar JupyterLab y nbstata
pipx upgrade jupyterlab
pipx runpip jupyterlab install --upgrade nbstata

# Desinstalar todo (limpio)
jupyter kernelspec uninstall nbstata
pipx uninstall jupyterlab
```

---

## Por qué `pipx` y no `pip` global

- **Aislado**: `pipx` crea un venv dedicado por herramienta, sin contaminar el Python del sistema ni el de tus proyectos.
- **Global al usuario**: los comandos (`jupyter`, `jupyter lab`) quedan disponibles desde cualquier carpeta.
- **Reproducible**: si algo se rompe, basta con `pipx uninstall jupyterlab` y volver a instalar — no toca nada más.
- **Mejor que el Python del sistema**: en macOS/Linux, el Python preinstalado es para uso interno del SO; mezclar paquetes ahí causa problemas de permisos y rompe dependencias del sistema.
