import 'package:core_flutter_flutterside/f_cupertino_text_field.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: "Notes app",
        home: CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text("Write Note"),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const FCupertinoTextField(),
                    const SizedBox(height: 8.0),
                    CupertinoButton.filled(
                        color: CupertinoColors.activeBlue,
                        onPressed: () {
                          print("ok");
                        },
                        child: const Text("Save Note")),
                  ])),
            )));
  }
}
