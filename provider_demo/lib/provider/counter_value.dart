import 'package:flutter/cupertino.dart';

class CounterValue extends ChangeNotifier {
  int counterValue = 0;

  increment() {
    counterValue++;
    notifyListeners();
  }

  decrement() {
    counterValue--;
    notifyListeners();
  }
}
