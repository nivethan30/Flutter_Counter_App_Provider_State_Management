import '../core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CounterProvider, ThemeProvider>(
        builder: (context, counterProvider, themeProvider, child) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Counter App",
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              elevation: 10,
              actions: [
                IconButton(
                    tooltip: "Toggle theme",
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                    icon: themeProvider.themeData == themeProvider.lightTheme
                        ? const Icon(
                            Icons.brightness_4,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.brightness_7,
                            color: Colors.white,
                          ))
              ],
            ),
            body: Center(
              child: Text(
                "Count Value : ${counterProvider.count}",
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  floatingActionButtons(
                    tooltip: "Decrease Count",
                    iconData: Icons.remove,
                    onPressed: counterProvider.count == 0
                        ? null
                        : () {
                            counterProvider.decrementCounter();
                          },
                  ),
                  const SizedBox(width: 10),
                  floatingActionButtons(
                      tooltip: "Reset Count",
                      iconData: Icons.refresh,
                      onPressed: counterProvider.count == 0
                          ? null
                          : () {
                              counterProvider.resetCounter();
                            }),
                  const SizedBox(width: 10),
                  floatingActionButtons(
                      tooltip: "Increase Count",
                      iconData: Icons.add,
                      onPressed: () {
                        counterProvider.increamentCounter();
                      })
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat),
      );
    });
  }

  SizedBox floatingActionButtons(
      {required IconData iconData,
      required VoidCallback? onPressed,
      required String tooltip}) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        tooltip: tooltip,
        onPressed: onPressed,
        child: Icon(iconData),
      ),
    );
  }
}
