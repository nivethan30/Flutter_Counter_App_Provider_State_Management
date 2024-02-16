import 'core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final CounterProvider counterProvider = CounterProvider();
  final ThemeProvider themeProvider = ThemeProvider();
    themeProvider.loadTheme();
  counterProvider.getCountPreferences();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: themeProvider),
    ChangeNotifierProvider.value(value: counterProvider),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: "Counter Application",
      theme: themeProvider.themeData,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
