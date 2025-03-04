class StringCalc {
  static int add(String numbers) {
    String delimiter = ',|\n';

    if (numbers.startsWith('//')) {
      int delimiterEndIndex = numbers.indexOf('\n');
      if (delimiterEndIndex == -1) {
        throw ArgumentError("Invalid input format");
      }

      if (numbers.startsWith('//[')) {
        String delimiters = numbers.substring(3, delimiterEndIndex - 1);
        List<String> delimiterList = delimiters.split('][');
        delimiter = delimiterList.map((d) => RegExp.escape(d)).join('|');
      } else {
        String customDelimiter = numbers.substring(2, delimiterEndIndex);
        delimiter = RegExp.escape(customDelimiter);
      }
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
    List<int> validNumbers = [];
    for (String number in numberStrings) {
      if (!RegExp(r'^-?\d+$').hasMatch(number)) {
        throw ArgumentError("Input must contain only numbers");
      }
      int num = int.parse(number);
      if (num < 0) {
        negativeNumbers.add(number);
      } else if (num <= 1000) {
        validNumbers.add(num);
      }
    }

    if (negativeNumbers.isNotEmpty) {
      throw ArgumentError(
          "Negatives not allowed: ${negativeNumbers.join(', ')}");
    }

    return validNumbers.reduce((a, b) => a + b);
  }
}
