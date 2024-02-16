import '../core/core.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData = _lightTheme;
  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();

  ThemeData get themeData => _themeData;
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  void toggleTheme() {
    _themeData = (_themeData == _lightTheme) ? _darkTheme : _lightTheme;
    saveTheme();
    notifyListeners();
  }

  Future<void> saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeType = (_themeData == _lightTheme) ? 1 : 0;
    prefs.setInt('theme', themeType);
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? themeType = prefs.getInt('theme');
    if (themeType == null) {
      _themeData = _lightTheme;
    } else {
      _themeData = (themeType == 1) ? _lightTheme : _darkTheme;
    }
    notifyListeners();
  }
}
