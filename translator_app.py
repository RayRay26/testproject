from deep_translator import GoogleTranslator


def translate_dutch_to_italian(text: str) -> str:
    """Translate Dutch text to Italian."""
    if not text.strip():
        return ""
    return GoogleTranslator(source="nl", target="it").translate(text)


def main() -> None:
    print("Dutch → Italian Translator")
    print("Type text in Dutch and press Enter.")
    print("Type 'exit' or 'quit' to stop.\n")

    while True:
        user_input = input("Dutch text: ").strip()

        if user_input.lower() in {"exit", "quit"}:
            print("Goodbye!")
            break

        if not user_input:
            print("Please enter some text.\n")
            continue

        translated = translate_dutch_to_italian(user_input)
        print(f"Italian: {translated}\n")


if __name__ == "__main__":
    main()
