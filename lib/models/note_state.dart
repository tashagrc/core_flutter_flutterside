class NoteState {
  final String note;
  NoteState({required this.note});

  NoteState copyWith({String? note}) {
    return NoteState(note: note ?? this.note);
  }
}
