// Budget App V1

import 'oop_practice.dart';

void main(){
  var groceries = Category("Groceries", percentage: 0.50);

  groceries.addPercentage();
  groceries.addAmount(500);
  groceries.subtract(260);
}