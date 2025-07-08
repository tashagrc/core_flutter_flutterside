import 'package:core_flutter_flutterside/services/note_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:core_flutter_flutterside/notifiers/note_notifier.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  late final NoteNotifier _notifier;

  @override
  void initState() {
    super.initState();
    final noteRepo = PlatformNoteRepository();
    _notifier = NoteNotifier(noteRepo);

    // keep state in sync with user input
    _textController.addListener(() {
      _notifier.updateNote(_textController.text);
    });
  }

  @override
  void dispose() {
    _notifier.dispose();
    _textController.dispose();
    super.dispose();
  }

  Widget _buildNoteTextField() => CupertinoTextField(
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
      );

  Widget _buildSaveButton() => CupertinoButton.filled(
      color: CupertinoColors.activeBlue,
      onPressed: _notifier.saveNote,
      child: const Text("Save Note"));

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
                      child: _buildNoteTextField(),
                    ),
                    const SizedBox(height: 8.0),
                    _buildSaveButton()
                  ])),
            )));
  }
}
