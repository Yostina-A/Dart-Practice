import 'oop_practice.dart';

void main(){
  Payment pay = PayByWallet();
  pay.pay(1000, "Tina");

  // assigning a new child class object to the "pay" var is called polymorphism
  pay = PayByCreditCard(); 
  pay.pay(500, "Rose");
}