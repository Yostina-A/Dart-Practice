// Practicing interface, abstraction & polymorphism


 abstract class Payment {
  void pay(double amount, String name); //this sysntax is called abstract method

  void printReciept(double amount){
    print("You have paid the amount of $amount");
  }
}


class PayByWallet extends Payment {

  @override
  void pay(double amount, String name) {
    print("$name paid $amount using Wallet.");
    //we don't need the "super" keyword here to call the parent class's method since we didn't
    //override it in the child class.
    printReciept(amount);
  }
}


class PayByCreditCard extends Payment {

  @override
  void pay(double amount, String name) {
    print("$name paid $amount using credit card.");

    printReciept(amount);
  }
}