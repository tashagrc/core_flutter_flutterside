import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('natasharadika.flutter.dev/note');
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _sendNoteToNative() async {
    final note = _textController.text;
    try {
      // call method on ios
      await platform.invokeMethod('saveNote', {"note": note});
      print("note sent: $note");
    } on PlatformException catch (e) {
      print("failed to send note ${e.message}");
    }
  }

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
                    SizedBox(
                      height: 500,
                      child: CupertinoTextField(
                        controller: _textController,
                        placeholder: "Enter note..",
                        maxLines: null,
                        expands: true,
                        autocorrect: true,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.top,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: CupertinoColors.lightBackgroundGray,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0)),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    CupertinoButton.filled(
                        color: CupertinoColors.activeBlue,
                        onPressed: _sendNoteToNative,
                        child: const Text("Save Note")),
                  ])),
            )));
  }
}
