import 'package:flutter/material.dart';
import 'package:sharing_app/app/app.bottomsheets.dart';
import 'package:sharing_app/app/app.dialogs.dart';
import 'package:sharing_app/app/app.locator.dart';
import 'package:sharing_app/app/app.router.dart';
import 'package:sharing_app/services/sharedPreferences.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
