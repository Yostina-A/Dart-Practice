// Practicing OOP on Budget app


double income = 2600;

/*
class Budget{
  
  Budget(this.name);
  Budget.byPercentage(this.name, this.percentage);
  Budget.byAmount(this.name, this.amount);
  
  String name;
  double? percentage;
  double? amount;
  double balance = 0;
  String currency = "EGP";

  void addAmount(double amount){
    balance += amount;
    print("$name \n Balance: $currency$balance");
  }

  void addMonthlyPercentage(){
    if(percentage != null){
      balance += income * percentage! ;
      print("$name \n Balance: $currency$balance");
    }
  }

  void addMonthlyAmount(double? amount){
    if(amount != null && amount != 0){
      balance += amount;
      print("$name \n Balance: $currency$balance");
    }
  }

  void subtractExpense(double amount){
    if(amount <= balance){
      balance -= amount;
      print("$name \n Balance: $currency$balance");
    }
  }


  void rename(String name){
    name = name;
  }

  void delete(){
    //deleteing the category
  }
}
*/


// Copilot solution with factory constructor

class Budget {
  String name;
  double? amount;
  double? percentage;
  double balance = 0;
  String currency = "EGP";

  // Private default constructor (can't be called outside)
  Budget._(this.name, {this.amount, this.percentage});

  // Named constructors
  Budget.byPercentage(this.name, this.percentage) : amount = null;
  Budget.byAmount(this.name, this.amount) : percentage = null;

  // Factory constructor
  factory Budget(String name, {double? amount, double? percentage}) {
    if ((amount == null && percentage == null) ||
        (amount != null && percentage != null)) {
      throw ArgumentError(
        "You must provide either amount OR percentage, not both or none."
      );
    }

    if (amount != null) {
      return Budget.byAmount(name, amount);
    } else {
      return Budget.byPercentage(name, percentage!);
    }
  }// Factory constructor



  void addAmount(double amount){
    balance += amount;
    print("$name \n Balance: $currency$balance");
  }

  void addMonthlyPercentage(){
    if(percentage != null){
      balance += income * percentage! ;
      print("$name \n Balance: $currency$balance");
    }
  }

  void addMonthlyAmount(double? amount){
    if(amount != null && amount != 0){
      balance += amount;
      print("$name \n Balance: $currency$balance");
    }
  }

  void subtractExpense(double amount){
    if(amount <= balance){
      balance -= amount;
      print("$name \n Balance: $currency$balance");
    } else{
      print("There is no enough balance!");
    }
  }


  void rename(String name){
    this.name = name;
  }

  void delete(){
    //deleteing the category
  }
}

