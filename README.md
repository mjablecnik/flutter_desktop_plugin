# Desktop US→CZ Keyboard Converter

A cross-platform Flutter desktop utility for quickly converting text typed on a US QWERTY keyboard to the equivalent output as if typed on a Czech QWERTY keyboard. Designed for developers and users who frequently switch between US and Czech keyboard layouts.

## Features

- **US→CZ Keyboard Conversion:** Converts numbers and symbols from US QWERTY to Czech QWERTY layout. Letters are left unchanged.
- **Clipboard Integration:** 
  - On app resume, if the clipboard contains text, it is auto-filled into the input field.
  - After conversion, the result is automatically copied to the clipboard.
- **System Tray Icon:** 
  - Always accessible from the system tray.
  - Tray menu with "Show" and "Exit" options.
  - Clicking the tray icon toggles the app window visibility.
- **Always-on-Top Window:** Small, focused window (350x250) that stays above other windows for quick access.
- **Cross-Platform:** Runs on macOS, Windows and Linux.

## Usage

1. **Launch the app.** The window appears or can be toggled from the system tray.
2. **Paste or type text** (as typed on a US QWERTY keyboard) into the input field.
3. **Click "US to CZ".** The converted text appears below and is copied to your clipboard.
4. **Clipboard auto-fill:** When the app regains focus, it auto-fills the input field with clipboard text if available.

## Example

- Input: `Nem;6u se do4kat a6 pou6iju tuto n8dhernou aplikaci""`
- Output: `Nemůžu se dočkat až použiju tuto nádhernou aplikaci!!`
  
- Input: `Tak0 m83 r8d p2kn0 V8no4n9 d8rky< >/]`
- Output: `Také máš rád pěkné Vánoční dárky? :-)`

## Development

This project uses:
- [Flutter](https://flutter.dev/)
- [macos_ui](https://pub.dev/packages/macos_ui)
- [tray_manager](https://pub.dev/packages/tray_manager)
- [window_manager](https://pub.dev/packages/window_manager)

### Run

```sh
flutter run -d macos   # or windows, linux
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

© 2025 Martin Jablečník
