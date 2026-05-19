// Practicing OOP on Budget app
// Budget app v1 with logic in constructor

double income = 2600;

 class Category {
  // I added logic in the constructor (it acts like a fucnction) to check that user is providing either a percentage or an amount.
  Category(this.name, {this.amount, this.percentage}){
    if(amount == null && percentage == null){
      print("You must provide either an amount or a percentage. Not both or none.");
    } else if(amount != null){
      amount = amount;
    }else if(percentage != null){
      percentage = percentage;
    }else {
      print("You can't provide both amount and percentage!");
    }
  }

  String name;
  double? amount;
  double? percentage;
  double balance = 0;
  String currency = "EGP";

  void addPercentage(){
    if(percentage != null && percentage != 0.0){ // adding "!" after a nullable variable tells dart that it won't be null here.
      balance = balance + (percentage! * income);
      print("Blance: $currency $balance");
    }
  }

  void addAmount(double amount){
     balance += amount;
    print("Blance: $currency $balance");
  }
  
  void subtract(double expense){
    if(expense <= balance){
      balance -= expense;
      print("Balance: $currency $balance");
    }
  }
 }