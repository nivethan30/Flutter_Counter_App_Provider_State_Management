import '../core/core.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData;
  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();

  ThemeProvider() {
    _themeData = _lightTheme;
  }

  ThemeData get themeData => _themeData;
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  void toggleTheme() {
    _themeData = (_themeData == _lightTheme) ? _darkTheme : _lightTheme;
    notifyListeners();
  }
}
