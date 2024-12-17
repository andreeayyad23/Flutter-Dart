void main(List<String> args) {

int factorial(int n) {
    if (n == 0) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }

  int Function(int) twice(int Function(int) f) {
    return (int x) {
      return 1;
    };
  }

  // Arithmetic operations
  int result = 5 ~/ 5;
  double resultDouble = 5 / 5;
  print('Integer division result: $result');
  print('Double division result: $resultDouble');

  int x = 10;
  int y = 3;
  print('Addition result: ${x + y}');
  print('Subtraction result: ${x - y}');
  print('Multiplication result: ${x * y}');
  print('Division result: ${x / y}');
  print('Modulus result: ${x % y}');
  print('Integer division result: ${x ~/ y}');

  // Comparison operations
  bool isEqual = 5 == 5;
  bool isNotEqual = 5 != 5;
  print('Is equal: $isEqual');
  print('Is not equal: $isNotEqual');

  // String interpolation
  String myString = 'Hello ${5 + 5}';
  print(myString);

  final myFinalVariable = 5;
  if (myFinalVariable == 5) {
    print('myFinalVariable is 5');
  } else if (myFinalVariable == 10) {
    print('myFinalVariable is 10');
  } else {
    print('myFinalVariable is not 5 or 10');
  }

  switch (myFinalVariable) {
    case 5:
      print('myFinalVariable is 5');
      break;
    case 10:
      print('myFinalVariable is 10');
      break;
    default:
      print('myFinalVariable is not 5 or 10');
  }

  for (int i = 0; i < 10; i++) {
    print('i is $i');
  }

  bool condition = true;
  while (condition) {
    print('condition is true');
    condition = false;
  }
  do {
    print('hello');
    condition = false;
  } while (condition);

  String returnStringNested() {
    return 'Hello';
  }

  String returnString() {
    return 'Hello';
  }

  void otherFunction() {
    returnString();
    returnStringNested();
  }

  void mainFunction() {
    returnStringNested();
    returnString();
    otherFunction();
  }

  mainFunction();
}

void positionalParameters(String firstName, double height, int age) {
  print('Name: $firstName, Age: $age, Height: $height');
}

void optionalParameters(String firstName, [double height = 0.0, int age = 0]) {
  print('Name: $firstName, Age: $age, Height: $height');
}

void nameOptionalParameters({
  int? x,
  double? y,
  String greet = 'Hello',
}) {
  nameOptionalParameters(x: 5, y: 5.0);
}

void namedRequiredParameters({required String name, required int age}) {}

void improvedFunction() {
  // Improved function with better naming conventions and comments
  int sum = 5 + 5;
  print('Sum: $sum');

  // Improved if-else statement with more descriptive variable names
  int myVariable = 5;
  if (myVariable == 5) {
    print('myVariable is 5');
  } else if (myVariable == 10) {
    print('myVariable is 10');
  } else {
    print('myVariable is not 5 or 10');
  }

  // Improved switch statement with more descriptive variable names
  switch (myVariable) {
    case 5:
      print('myVariable is 5');
      break;
    case 10:
      print('myVariable is 10');
      break;
    default:
      print('myVariable is not 5 or 10');
  }

  // Improved for loop with more descriptive variable names
  for (int i = 0; i < 10; i++) {
    print('i is $i');
  }

  // Improved while loop with more descriptive variable names
  bool myCondition = true;
  while (myCondition) {
    print('myCondition is true');
    myCondition = false;
  }

  // Improved do-while loop with more descriptive variable names
  do {
    print('hello');
    myCondition = false;
  } while (myCondition);
}
