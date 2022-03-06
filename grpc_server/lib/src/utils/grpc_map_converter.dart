import 'dart:convert';

class GrpcMapConverter {
  static String convert(Map input) {
    final inputKeysList = input.keys.toList();
    final Map<String, dynamic> convertedInput = input
        .map((k, v) => MapEntry((inputKeysList.indexOf(k) + 1).toString(), v));
    final String stringConvertedInput = jsonEncode(convertedInput);
    return stringConvertedInput;
  }
}
