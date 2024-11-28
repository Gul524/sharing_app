import 'package:flutter/material.dart';
import 'package:sharing_app/app/app.bottomsheets.dart';
import 'package:sharing_app/app/app.dialogs.dart';
import 'package:sharing_app/app/app.locator.dart';
import 'package:sharing_app/customWidgets/textfield.dart';
import 'package:sharing_app/services/functions.dart';
import 'package:sharing_app/ui/common/app_colors.dart';
import 'package:sharing_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  //final _appfunction = locator<AppFunctions>();
  final TextEditingController _name = TextEditingController();

  adduser() {
    _dialogService.showCustomDialog(
        variant: DialogType.infoAlert, title: "ghhh");
  }

  void addUserDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: kcPrimaryColorDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Add User",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kcPrimaryColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(hintText: "gul", controller: _name)
                ],
              ),
            ),
          );
        });
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
