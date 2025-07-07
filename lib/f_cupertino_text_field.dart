import 'package:flutter/cupertino.dart';

class FCupertinoTextField extends StatefulWidget {
  const FCupertinoTextField({super.key});

  @override
  State<FCupertinoTextField> createState() => _FCupertinoTextFieldState();
}

class _FCupertinoTextFieldState extends State<FCupertinoTextField> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
