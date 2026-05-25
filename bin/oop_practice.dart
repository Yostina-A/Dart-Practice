mixin Bite {
  void bite(){
    print("Animal is biting");
  }
}

mixin Scratch {
  void scratch(){
    print("Animal is scratcing");
  }
}

class K9{

  K9(this.type, this.name);

  String type;
  String name;
}

class Dog extends K9 with Bite{
  
  Dog(super.type, super.name);

  @override
  void bite(){
    print("Dog is biting");
  }
}

class Wolf extends K9 with Scratch{

  Wolf(super.type, super.name);

  @override
  void scratch(){
    print("Wolf is scratching");
  }
}

class Bear extends K9 with Bite, Scratch{

  Bear(super.type, super.name);

  @override
  void bite(){
    print("Bear is biting");
  }
  @override
  void scratch(){
    print("Bear is scratching");
  }
}