class StringCalc {
  static int add(String numbers) {
    if (numbers.isEmpty || numbers.trim().isEmpty) {
      return 0;
    }

    if (!RegExp(r'^[0-9,]*$').hasMatch(numbers)) {
      throw ArgumentError("Input must contain only numbers and commas");
    }

    List<String> numberStrings = numbers.split(',');
    List<int> numberList = numberStrings.map(int.parse).toList();

    return numberList.reduce((a, b) => a + b);
  }
}
