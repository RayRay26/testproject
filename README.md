# Dutch to Italian Translator App

This project is a simple command-line app that translates any text you enter from **Dutch (Netherlands)** to **Italian**.

## What it does
- Accepts text input in Dutch.
- Translates it to Italian.
- Keeps running so you can translate multiple lines.
- Stops when you type `exit` or `quit`.

## Requirements
- Python 3.9+
- Internet connection (translation uses an online translation service)

## Installation
### macOS/Linux
Use the installation script:

```bash
./install.sh
```

The script will:
1. Create a `.venv` virtual environment (if it doesn't already exist).
2. Upgrade `pip`.
3. Install dependencies from `requirements.txt`.

If virtual environment creation fails because `ensurepip` is unavailable (common on minimal Debian/Ubuntu installs), install the matching venv package and rerun:

```bash
sudo apt install python3.13-venv
./install.sh
```

If your Python version is different, replace `3.13` with your version (for example, `python3.12-venv`).

### Windows (PowerShell)
Use these commands:

```powershell
py -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

## Run the app
### macOS/Linux
```bash
source .venv/bin/activate
python translator_app.py
```

### Windows (PowerShell)
```powershell
.venv\Scripts\Activate.ps1
python translator_app.py
```

## Usage
1. Run the app.
2. Type a Dutch sentence and press Enter.
3. Read the Italian translation.
4. Repeat as needed.
5. Type `exit` or `quit` to close.

## Example
Input:
```text
Ik hou van reizen en lekker eten.
```
Output:
```text
Amo viaggiare e mangiare bene.
```
