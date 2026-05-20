// Recipe page

class Recipe{
  
  // default constructor
  Recipe(this.image, this.name, this.description, this.ingredients, this.method);

  // variables
  final dynamic image;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> method;

  // methods
  void cookMode(){
    print("Cooking mode active");
  }
}