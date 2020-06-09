import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _counter = 0;
  int get counter => _counter;

  incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
