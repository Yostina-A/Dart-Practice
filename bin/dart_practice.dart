
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
  // using a custom getter is best practice to retrieve and print enum values
}



enum HobbyDifficulty {
  easy, medium, hard;

  String get label{
    switch(this) {
      case HobbyDifficulty.easy: return "Easy";
      case HobbyDifficulty.medium: return "Medium";
      case HobbyDifficulty.hard: return "Hard";
    }
  }
}

/*class Person {
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
}*/




class Person {
  Person(this.name, this.age, this.hobbies);

  String name;
  int age;
  List<Hobbies> hobbies;


  void printPerson(){
    print("Name: $name \n Age: $age \n\n Hobbies: ");
    hobbies.forEach((hobby){
      hobby.printHobby(); /*we made a map of each hobby in the Hobbies class so that each
      hobby would print itself using the printHobby() method in Hobbies class.*/
    }
    );
  }


 
}


class Hobbies {
  Hobbies(this.name, {this.category, this.tools, this.difficulty});

  String name;
  String? category;
  List<String>? tools;
  HobbyDifficulty? difficulty;

    /* this is a method to turn each hobby object into a map so the we can loop through it
    later in the printHobby method. */
    Map<String, Object?> toMap(){
        return{
        "Name": name,
        "Category": category,
        "Tools": tools,
        "Difficulty": difficulty?.label,
        };
      }

      /* this is the method that will loop throught the vlaues and keys of each hobby
      after it has been turned into a map and prints only the values that are not null. */
      void printHobby(){
        toMap().forEach((key, value){
          if (value != null) {
            print("$key: $value");
          }
        } 
        );
      }
    }
  






void main(){
  //Person p1 = Person("Tina", 35, {"Drawing": HobbyLevel.fair, "Cream Piping": HobbyLevel.good});
  //p1.printData();


Person p2 = Person(
  "Tina",
  35,

  [Hobbies("Drawing",
    category: "Visual Arts",
    tools: ["Paper", "Pencil"],
    //difficulty: HobbyDifficulty.medium
  ),

  Hobbies("Butter Cream Piping",
    category: "Culinary Arts",
    //tools: ["Butter Cream", "Piping Bag"],
    difficulty: HobbyDifficulty.hard
  ),
  ]
);
 

 p2.printPerson();
}