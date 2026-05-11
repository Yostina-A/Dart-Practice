

class Person {
  Person(this.name, this.age, this.hobbies);
  String name;
  int age;
  Map<String,String> hobbies;

  void printData(){
    print("Name: $name");
    print("Age: $age");
    print("Hobbies: $hobbies");
  }
}

class Hobbies {
  Hobbies(this.name, this.category, this.tools);

  String name;
  String category;
  List<String> tools;
}

void main(){
  Person p1 = Person("Tina", 35, {"Drawing":"Good", "Cream Piping": "Good"});
  p1.printData();
}