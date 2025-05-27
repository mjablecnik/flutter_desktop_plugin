import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_desktop_plugin/utils.dart';

void main() {
  group('keyboardFromUsToCz', () {
    test('translates letters', () {
      expect(Utils.keyboardFromUsToCz('qwertyuiopasdfghjklzxcvbnm'), 'qwertyuiopasdfghjklzxcvbnm');
      expect(Utils.keyboardFromUsToCz('QWERTYUIOPASDFGHJKLZXCVBNM'), 'QWERTYUIOPASDFGHJKLZXCVBNM');
    });

    test('translates numbers and symbols', () {
      expect(Utils.keyboardFromUsToCz('1234567890'), '+ěščřžýáíé');
      expect(Utils.keyboardFromUsToCz('!@#\$%^&*()'), '1234567890'); // No shift, direct mapping
      expect(Utils.keyboardFromUsToCz('-_+'), '=%ˇ'); // No shift, direct mapping
      expect(Utils.keyboardFromUsToCz('[]{}'), 'ú)/(');
      expect(Utils.keyboardFromUsToCz(';:\'\"'), 'ů"§!');
      expect(Utils.keyboardFromUsToCz(',./<>?'), ',.-?:_'); // Shifted characters map correctly
      expect(Utils.keyboardFromUsToCz('`~'), '\\|');
    });

    test('leaves unmapped characters unchanged', () {
      expect(Utils.keyboardFromUsToCz('Hello World! 123'), 'Hello World1 +ěš');
      expect(Utils.keyboardFromUsToCz('áčďéěíňóřšťúůýž'), 'áčďéěíňóřšťúůýž');
    });

    test('works with empty string', () {
      expect(Utils.keyboardFromUsToCz(''), '');
    });

    test('works with mixed input', () {
      expect(
        Utils.keyboardFromUsToCz('The quick brown fox jumps over 1234567890!'),
        'The quick brown fox jumps over +ěščřžýáíé1',
      );
    });

    test('works with real czech sentence', () {
      expect(
        Utils.keyboardFromUsToCz('Ahoj, jak se v3ichni m8te<'),
        'Ahoj, jak se všichni máte?',
      );
    });
  });
}
