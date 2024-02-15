import '../core/core.dart';

class CounterProvider extends ChangeNotifier {
  late int _count = 0;

  int get count => _count;

  void increamentCounter() {
    _count++;
    updateCountPreferences();
  }

  void decrementCounter() {
    if (_count > 0) {
      _count--;
    }
    updateCountPreferences();
  }

  void resetCounter() {
    _count = 0;
    updateCountPreferences();
  }

  Future<void> updateCountPreferences() async {
    await setCountPreferences(_count);
    notifyListeners();
  }

  Future<void> setCountPreferences(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', count);
  }

  Future<void> getCountPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? count = prefs.getInt('count');
    if (count != null) {
      _count = count;
    }
    notifyListeners();
  }
}
