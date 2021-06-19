import 'package:flutter/services.dart';

class DoubleTextInputFormatter extends TextInputFormatter {
  static const doubleRegexp = r'^(-?)(0|([1-9][0-9]*))(\.([0-9]?)+)?$';

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final value = _format(oldValue, newValue);
    return TextEditingValue(
        text: value.text, selection: TextSelection.fromPosition(TextPosition(offset: value.text.length)));
  }

  TextEditingValue _format(TextEditingValue oldValue, TextEditingValue newValue) {
    final regexp = RegExp(doubleRegexp);
    final chars = newValue.text.split('');

    final matches = regexp.hasMatch(newValue.text);
    final isOnlyMinus = chars.length == 1 && chars.first == '-';
    return isOnlyMinus || matches || newValue.text.isEmpty ? newValue : oldValue;
  }
}
