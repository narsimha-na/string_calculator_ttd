# String Calculator using TTD with all unit test cases

A simple string calculator that can perform addition on numbers provided in a string format. The calculator supports custom delimiters, including both single-character and multi-character delimiters.

## Features

- Supports addition of numbers separated by commas, new lines, or custom delimiters.
- Allows for single-character and multi-character delimiters.
- Handles multiple custom delimiters in the format `//[delim1][delim2]\n`.
- Throws errors for invalid inputs, including negative numbers and non-numeric values.

## Test-Driven Development (TDD)

This project was developed using traditional Test-Driven Development (TDD) principles. The development process involved writing tests before implementing the corresponding functionality. This approach ensures that the code meets the specified requirements and behaves as expected.

### Key TDD Practices

1. **Write a Test**: Before implementing a feature, a test is written to define the expected behavior.
2. **Run the Test**: The test is run to confirm that it fails (since the feature is not yet implemented).
3. **Implement the Feature**: The code is written to make the test pass.
4. **Refactor**: The code is refactored for clarity and efficiency while ensuring that all tests still pass.
5. **Repeat**: This cycle is repeated for each new feature or change.

## Installation

To use this project, you need to have Flutter installed on your machine. Follow these steps to set up the project:

1. Clone the repository:

   ```bash
   git clone https://github.com/narsimha-na/string_calculator_ttd.git
   cd string_calculator
   ```

2. Install the dependencies:
   ```bash
   flutter pub get
   ```

## Usage

To use the string calculator, you can call the `add` method from the `StringCalc` class. Here are some examples:
