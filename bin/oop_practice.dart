class Person {
  Person(this.name, this.age);

  final String name;
  final int age;

  void walk(){
    print("$name is walking");
  }

  void work(String value){
    print("$name is working on $value");
  }
}


class Engineer extends Person {
  Engineer(super.name, super.age, this.job);

  String job;

  /*@override
  void walk(){
    super.walk();
    print("$name has finished walking");
  }*/
  @override
  void work(String value){
    print("$name is developing $value");
  }
}

class Doctor extends Person{
  Doctor(super.name, super.age, this.hobby);

  String hobby;

  @override
  void work(String value){
    print("$name is a doctor and he is checking $value at the moment");
  }
}



class Car {
  Car(this.brand, this.model, this.type);

  String brand;
  int model;
  String type;

  void go(){
    print("The $brand car is going");
  }
}

class Hyundai extends Car{
  Hyundai(super.brand, super.model, super.type, this.color);
  
  String color;
  String? motorType;

  void printMotorType(){
    print("The $brand car model numer: $model has a motor type of $motorType");
  }

}

enum moveType {
  fly, walk, swim;

  String get label {
    switch(this){
      case moveType.fly: return "Fly";
      case moveType.walk: return "Walk";
      case moveType.swim: return "Swim";
    }
  }
}
class Animal {
  Animal(this.type, this.name, this.moveHow, this.sound);

  String type;
  String name;
  moveType moveHow;
  String sound;

  void move(){
    print("$name is moving");
  } 
}

class Dog extends Animal{
  Dog(super.type, super.name, super.moveHow, super.sound, this.breed);

  String breed;

  @override
  void move(){
    print("$name is a dog of breed $breed and it says '$sound'");
  }
}
