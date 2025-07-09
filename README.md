# Goal
- Understand Flutter and native iOS communication
- Understand Flutter widgets, unidirectional data flow, and FlutterMethodChannel
  
# Description
This is a Flutter module that is integrated with an iOS project. The Flutter module contains a page where there is a textfield where user can write a note and a button to save note. When the button is clicked, it will send a note data to the iOS side.
In this project I only applied a very brief unidirectional data flow because the use case is not clear enough. I planned on learning more about UDF in another project.

# Things learned
- Creating state and notifier to implements UDF.
- Using method channel to send data to iOS.
- Learned the difference between Stateful and Stateless Widget, Material and Cupertino design system widget.
- Also learn a bit about Flutter concurrency.
  
# Project structure
- main.dart: the UI.
- /models
  - note_state.dart: act as the single source of truth of the note data.
- /notifiers
  - note_notifier.dart: notify the listener if there is any changes in note data.
- /services
  - note_repository.dart: act as a manager of method channel to send data to iOS.

# Screenshot
<img src="https://github.com/user-attachments/assets/153e9653-e9d2-4c8f-9ecb-2c4767fc5708" alt="Simulator Screenshot - iPhone 16 Pro" width="300" style="border: 2px solid black;" />


