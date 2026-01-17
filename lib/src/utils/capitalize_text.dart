import 'package:flutter/services.dart';

class CapitalizeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.isEmpty) return newValue;

    // Capitalize the first letter
    newText = newText[0].toUpperCase() + newText.substring(1);

    // Capitalize the first letter after each space
    newText = newText.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      }
      return word;
    }).join(' ');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
