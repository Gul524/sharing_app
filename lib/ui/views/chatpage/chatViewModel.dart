import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:sharing_app/services/functions.dart';
import 'package:sharing_app/models/chatmodel.dart';

class ChatViewModel extends ReactiveViewModel {
  final TextEditingController msjj = TextEditingController();

  // Getter for the messages of the current chat
  List<Messages> getMessages(int userIndex) =>
      userlist[userIndex].messages ?? [];

  void addmessage(int userIndex, String type) {
    if (msjj.text.trim().isEmpty) return;

    final message = Messages(
      type: texttype,
      message: msjj.text,
      time: DateTime.now().toString().substring(11, 16),
      date: DateTime.now().toString().substring(0, 10),
    );

    AppFunctions().add_msj(
      userlist[userIndex].name!,
      userlist[userIndex].phone!,
      message,
    );

    msjj.clear();
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      []; // Add your reactive services here

  @override
  void dispose() {
    msjj.dispose();
    super.dispose();
  }
}
