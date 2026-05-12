
enum HobbyLevel {
  excelent, good, fair, weak;

  String get label {
    switch(this){
    case HobbyLevel.excelent: return "Excelent";
    case HobbyLevel.good: return "Good";
    case HobbyLevel.fair: return "Fair";
    case HobbyLevel.weak: return "Weak";
    }
  }
}

class Person {
  Person(this.name, this.age, this.hobbies);
  String name;
  int age;
  Map<String,HobbyLevel> hobbies;

  void printData(){
    print("Name: $name");
    print("Age: $age \n");
    
    print("Hobies: ");
    hobbies.forEach((key, value){
      print('$key: ${value.label}');
      }
    );
    }
}

/*class Hobbies {
  Hobbies(this.name, this.category, this.tools);

  String name;
  String category;
  List<String> tools;
}*/

void main(){
  Person p1 = Person("Tina", 35, {"Drawing": HobbyLevel.fair, "Cream Piping": HobbyLevel.good});
  p1.printData();
}