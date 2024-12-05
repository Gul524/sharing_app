import 'dart:convert';
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import 'package:sharing_app/models/chatmodel.dart';
import 'package:sharing_app/services/sharedPreferences.dart';
import 'package:stacked/stacked.dart';

List<ChatModel> userlist = ReactiveList();
String mykey = "list";
String phototype = "photo";
String texttype = "text";


class AppFunctions {
  static final AppFunctions appfunctions = AppFunctions.internal();

  AppFunctions.internal();

  factory AppFunctions() {
    return appfunctions;
  }
  
  Future<bool> addUser(String Name, int Phone) async {
    bool saved = true;
    if (userlist.isNotEmpty) {
      for (ChatModel i in userlist) {
        if (i.name == Name && i.phone == Phone) {
          saved = false;
        }
      }
      if (saved) {
        ChatModel user = ChatModel(
          name: Name,
          phone: Phone,
          messages: [],
        );
        userlist.add(user);
      }
    } else {
      ChatModel user = ChatModel(
        name: Name,
        phone: Phone,
        messages: [],
      );
      userlist.add(user);
    }
    await SharedPreferencesService().setValue(mykey, jsonEncode(userlist));
    return saved;
  }

  deleteUser(int Phone) async {
    userlist.removeWhere((i) => i.phone == Phone);
    await SharedPreferencesService().setValue(mykey, jsonEncode(userlist));
  }

  add_msj(String Name, int Phone, Messages msj) async {
    for (ChatModel i in userlist) {
      if (i.phone == Phone) {
        i.name = Name;
        i.phone = Phone;
        i.messages!.add(msj);
      }
    }
    await SharedPreferencesService().setValue(mykey, jsonEncode(userlist));
  }

  delete_msj(int Phone, int msjIndex) async {
    for (ChatModel i in userlist) {
      if (i.phone == Phone) {
        i.messages!.removeAt(msjIndex);
      }
    }
    await SharedPreferencesService().setValue(mykey, jsonEncode(userlist));
  }
}
