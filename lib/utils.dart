library;
/// Converts a string typed on a US QWERTY keyboard to the equivalent output
/// as if the same keys were pressed on a Czech QWERTY keyboard.
/// Only standard visible ASCII characters are mapped.
/// Characters not present in the mapping are left unchanged.

class Utils {
  static String keyboardFromUsToCz(String input) {
    const Map<String, String> map = {
      //// Letters
      //'q': 'q', 'w': 'w', 'e': 'e', 'r': 'r', 't': 't', 'y': 'y', 'u': 'u', 'i': 'i', 'o': 'o', 'p': 'p',
      //'a': 'a', 's': 's', 'd': 'd', 'f': 'f', 'g': 'g', 'h': 'h', 'j': 'j', 'k': 'k', 'l': 'l',
      //'z': 'z', 'x': 'x', 'c': 'c', 'v': 'v', 'b': 'b', 'n': 'n', 'm': 'm',

      //'Q': 'Q', 'W': 'W', 'E': 'E', 'R': 'R', 'T': 'T', 'Y': 'Y', 'U': 'U', 'I': 'I', 'O': 'O', 'P': 'P',
      //'A': 'A', 'S': 'S', 'D': 'D', 'F': 'F', 'G': 'G', 'H': 'H', 'J': 'J', 'K': 'K', 'L': 'L',
      //'Z': 'Z', 'X': 'X', 'C': 'C', 'V': 'V', 'B': 'B', 'N': 'N', 'M': 'M',

      // Numbers and symbols (top row)
      '1': '+', '2': 'ě', '3': 'š', '4': 'č', '5': 'ř', '6': 'ž', '7': 'ý', '8': 'á', '9': 'í', '0': 'é',
      '!': '1', '@': '2', '#': '3', '\$': '4', '%': '5', '^': '6', '&': '7', '*': '8', '(': '9', ')': '0',

      // US symbols to Czech equivalents
      '-': '=',
      '_': '%', '+': 'ˇ',

      '[': 'ú', ']': ')', '{': '/', '}': '(',
      ';': 'ů', '\'': '§', ':': '"', '"': '!',
      ',': ',', '.': '.', '/': '-', '<': '?', '>': ':', '?': '_',

      '`': '\\', '~': '|',
    };

    return input.split('').map((c) => map[c] ?? c).join();
  }
}