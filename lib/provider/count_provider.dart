import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 30;
  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
