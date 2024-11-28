import 'dart:convert';
import 'package:sharing_app/models/chatmodel.dart';
import 'package:sharing_app/services/sharedPreferences.dart';

List<ChatModel?> userlist = [];
String mykey = "list";

class AppFunctions {
  static final AppFunctions appfunctions = AppFunctions.internal();

  AppFunctions.internal();

  factory AppFunctions(){
    return appfunctions;
  }

  addUser(String Name, int Phone) async {
    bool alreadyInList = false;
    if (userlist.isNotEmpty) {
      for (ChatModel? i in userlist) {
       if(i != null){
         if (i.name == Name && i.phone == Phone) {
          alreadyInList = true;
        }
       }
      }
    }
    if (!(alreadyInList)) {
      ChatModel user = ChatModel(
        name: Name,
        phone: Phone,
        messages: [],
      );
      userlist.add(user);
    }
    await SharedPreferencesService().setValue(mykey, jsonEncode(userlist));
  }

  deleteUser(int Phone) async {
    userlist.removeWhere((i) => i!.phone == Phone);
    await SharedPreferencesService().setValue(mykey,  jsonEncode(userlist));
  }

  add_msj(String Name, int Phone, Messages msj) async {
    for (ChatModel? i in userlist) {
      if (i!.phone == Phone) {
        i.name = Name;
        i.phone = Phone; 
        i.messages!.add(msj);
      }
    }
    await SharedPreferencesService().setValue(mykey, jsonEncode(userlist));
  }

  delete_msj(int Phone, int msjIndex) async {
    for (ChatModel? i in userlist) {
      if (i!.phone == Phone) {
        i.messages!.removeAt(msjIndex);
      }
    }
    await SharedPreferencesService().setValue(mykey, jsonEncode(userlist));
  }
}
