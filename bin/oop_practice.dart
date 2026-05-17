class Person {
  Person(this._name, this._age);

  String _name;
  int _age;

  // the use of setters and getters to handle private properties.

  set name (String name){
    _name = name;
  }

  set age (int age){
    _age = age;
  }

  String get name => _name;
  int get age => _age;
}