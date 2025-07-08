import 'package:flutter/services.dart';

abstract class NoteRepository {
  Future<void> saveNote(String note);
}

class PlatformNoteRepository implements NoteRepository {
  static const platform = MethodChannel('natasharadika.flutter.dev/note');

  @override
  Future<void> saveNote(String note) async {
    await platform.invokeMethod('saveNote', {"note": note});
  }
}
