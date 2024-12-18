// flutter_examples.dart

void main() {
  // Variables and Primitive Types
  int age = 25;
  double height = 5.9;
  String name = 'John Doe';
  bool isDeveloper = true;

  print('Name: $name');
  print('Age: $age');
  print('Height: $height');
  print('Is Developer: $isDeveloper');

  // Functions
  int result = add(5, 3);
  print('The result is: $result'); // Output: The result is: 8

  // Classes
  var person = Person('Alice', 30);
  person.introduce(); // Output: Hi, my name is Alice and I am 30 years old.

  // Asynchrony
  fetchData().then((data) => print(data)); // Output after 2 seconds: Data fetched

  // Collections
  List<int> numbers = [1, 2, 3, 4, 5];
  Map<String, int> ages = {'Alice': 30, 'Bob': 25};

  print('Numbers: $numbers');
  print('Ages: $ages');
}

// Functions
int add(int a, int b) => a + b;

// Classes
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() => print('Hi, my name is $name and I am $age years old.');
}

// Asynchrony
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched';
}
