import 'dart:convert';

import 'package:sharing_app/models/chatmodel.dart';
import 'package:sharing_app/services/functions.dart';
import 'package:sharing_app/services/sharedPreferences.dart';
import 'package:stacked/stacked.dart';
import 'package:sharing_app/app/app.locator.dart';
import 'package:sharing_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    final String saveddata = SharedPreferencesService().getValue(mykey) ?? "[]";
      final savedList = jsonDecode(saveddata);
    for (var i in savedList) {
      userlist.add( ChatModel.fromJson(i));
    }
    
    await Future.delayed(const Duration(seconds: 1));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }
}
