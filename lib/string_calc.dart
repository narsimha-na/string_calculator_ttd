class StringCalc {
  static int add(String numbers) {
    String cleanedInput = numbers.replaceAll('\n', ',');
    cleanedInput = cleanedInput.replaceAll(RegExp(r'\s+'), '');

    if (cleanedInput.isEmpty) {
      return 0;
    }

    if (!RegExp(r'^[0-9,]*$').hasMatch(cleanedInput)) {
      throw ArgumentError("Input must contain only numbers and commas");
    }
    List<String> numberStrings =
        cleanedInput.split(',').where((n) => n.isNotEmpty).toList();

    List<int> numberList = numberStrings.map(int.parse).toList();

    return numberList.reduce((a, b) => a + b);
  }
}
