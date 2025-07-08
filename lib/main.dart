import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// state
class NoteState {
  final String note;
  NoteState({required this.note});

  NoteState copyWith({String? note}) {
    return NoteState(note: note ?? this.note);
  }
}

// event, logic controller
class NoteNotifier extends ValueNotifier<NoteState> {
  static const platform = MethodChannel('natasharadika.flutter.dev/note');

  NoteNotifier() : super(NoteState(note: ""));

  void updateNote(String newNote) {
    value = value.copyWith(note: newNote);
  }

  Future<void> saveNote() async {
    try {
      // call method on ios
      await platform.invokeMethod('saveNote', {"note": value.note});
      print("note sent: ${value.note}");
    } on PlatformException catch (e) {
      print("failed to send note ${e.message}");
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  late final NoteNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = NoteNotifier();

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
                        onPressed: _notifier.saveNote,
                        child: const Text("Save Note")),
                  ])),
            )));
  }
}
