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
  });
}
