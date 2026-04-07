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

## Setup
1. (Optional) Create and activate a virtual environment:
   - macOS/Linux:
     ```bash
     python3 -m venv .venv
     source .venv/bin/activate
     ```
   - Windows (PowerShell):
     ```powershell
     py -m venv .venv
     .venv\Scripts\Activate.ps1
     ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Run the app
```bash
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
