class StringCalc {
  static int add(String numbers) {
    String delimiter = ',|\n';

    if (numbers.startsWith('//')) {
      int delimiterEndIndex = numbers.indexOf('\n');
      if (delimiterEndIndex == -1) {
        throw ArgumentError("Invalid input format");
      }
      delimiter = RegExp.escape(numbers.substring(2, delimiterEndIndex));
      numbers = numbers.substring(delimiterEndIndex + 1);
    }

    String cleanedInput = numbers.replaceAll('\n', ',');
    cleanedInput = cleanedInput.replaceAll(RegExp(r'\s+'), '');

    if (cleanedInput.isEmpty) {
      return 0;
    }

    List<String> numberStrings = cleanedInput
        .split(RegExp(delimiter))
        .where((n) => n.isNotEmpty)
        .map((n) => n.trim())
        .toList();

    List<String> negativeNumbers = [];
    for (String number in numberStrings) {
      if (!RegExp(r'^-?\d+$').hasMatch(number)) {
        throw ArgumentError("Input must contain only numbers");
      }
      int num = int.parse(number);
      if (num < 0) {
        negativeNumbers.add(number);
      }
    }

    if (negativeNumbers.isNotEmpty) {
      throw ArgumentError(
          "Negatives not allowed: ${negativeNumbers.join(', ')}");
    }

    List<int> numberList = numberStrings.map(int.parse).toList();

    return numberList.reduce((a, b) => a + b);
  }
}
