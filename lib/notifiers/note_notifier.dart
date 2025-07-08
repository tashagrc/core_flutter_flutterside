import 'package:core_flutter_flutterside/models/note_state.dart';
import 'package:core_flutter_flutterside/services/note_repository.dart';
import 'package:flutter/cupertino.dart';

// event, logic controller
class NoteNotifier extends ValueNotifier<NoteState> {
  final NoteRepository _repository;

  NoteNotifier(this._repository) : super(NoteState(note: ""));

  void updateNote(String newNote) {
    value = value.copyWith(note: newNote);
  }

  Future<void> saveNote() async {
    try {
      await _repository.saveNote(value.note);
    } catch (e) {
      print("failed to save note: $e");
    }
  }
}
