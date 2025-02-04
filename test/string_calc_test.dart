import 'package:string_calculator/string_calc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty string returns 0', () {
    expect(StringCalc.add(''), 0);
  });

  test('single number returns the number', () {
    expect(StringCalc.add('1'), 1);
  });

  test('two numbers returns their sum', () {
    expect(StringCalc.add('1,5'), 6);
  });

  test('ArgumentError for invalid input', () {
    expect(() => StringCalc.add('1,a,3'), throwsA(isA<ArgumentError>()));
    expect(() => StringCalc.add('1,2,three'), throwsA(isA<ArgumentError>()));
    expect(() => StringCalc.add('1, 2, -3'), throwsA(isA<ArgumentError>()));
    expect(() => StringCalc.add('1,2,3.5'), throwsA(isA<ArgumentError>()));
    expect(() => StringCalc.add('//;1;2;3'), throwsA(isA<ArgumentError>()));
  });

  test('multiple numbers returns their sum', () {
    expect(StringCalc.add('1,2,3,4,5'), 15);
  });

  test('handles large numbers', () {
    expect(StringCalc.add('1000,2000,3000'), 1000);
  });

  test('handles numbers with leading/trailing spaces', () {
    expect(StringCalc.add(' 1, 2, 3 '), 6);
  });

  test('handles multiple consecutive commas', () {
    expect(StringCalc.add('1,,,2,3'), 6);
  });

  test('handles multiple consecutive commas and new lines', () {
    expect(StringCalc.add('1,\n\n2,3'), 6);
  });
  test('supports custom delimiters', () {
    expect(StringCalc.add('//;\n1;2;3'), 6);
  });

  test('throws ArgumentError for negative numbers', () {
    expect(
        () => StringCalc.add('1,-2,3'),
        throwsA(predicate((e) =>
            e is ArgumentError && e.message == "Negatives not allowed: -2")));
    expect(
        () => StringCalc.add('//;\n1;-2;3;-4'),
        throwsA(predicate((e) =>
            e is ArgumentError &&
            e.message == "Negatives not allowed: -2, -4")));
  });

  test('ignores numbers greater than 1000', () {
    expect(StringCalc.add('2,1001'), 2);
    expect(StringCalc.add('1000,1001,2'), 1002);
    expect(StringCalc.add('//;\n1000;1001;2'), 1002);
  });

  test('supports multi-character custom delimiters', () {
    expect(StringCalc.add('//[***]\n1***2***3'), 6);
    expect(StringCalc.add('//[delimiter]\n1delimiter2delimiter3'), 6);
    expect(StringCalc.add('//[!]\n1!2!3'), 6);
    expect(StringCalc.add('//[abc]\n1abc2abc3'), 6);
  });

  test(' ArgumentError for invalid input format when delimiter is not closed',
      () {
    expect(() => StringCalc.add('//[***1***]\n2***3***4***5'),
        throwsA(isA<ArgumentError>()));
  });
  test('supports multiple custom delimiters', () {
    expect(StringCalc.add('//[*][%]\n1*2%3'), 6);
    expect(StringCalc.add('//[;][%]\n1;2%3'), 6);
    expect(StringCalc.add('//[delimiter][!]\n1delimiter2!3'), 6);
  });
}
