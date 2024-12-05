import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import 'package:sharing_app/app/app.bottomsheets.dart';
import 'package:sharing_app/app/app.locator.dart';
import 'package:sharing_app/customWidgets/textfield.dart';
import 'package:sharing_app/models/chatmodel.dart';
import 'package:sharing_app/services/functions.dart';
import 'package:sharing_app/ui/common/app_colors.dart';
import 'package:sharing_app/ui/common/app_strings.dart';
import 'package:sharing_app/ui/views/chatpage/chatView.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel() {
    _initializeSharing();
  }

  final _bottomSheetService = locator<BottomSheetService>();
  final _NavigationService = locator<NavigationService>();
  //final _appfunction = locator<AppFunctions>();
  bool editable = false;
  bool isadd = false;
  var sharedText;
  bool isSharing = false;

  void _initializeSharing() {
    // Listen for new shared intents
    FlutterSharingIntent.instance.getMediaStream().listen((sharedMedia) {
      if (sharedMedia.isNotEmpty && sharedMedia.first.value != null) {
        sharedText = sharedMedia;

        isSharing = true; // Text or URL
        notifyListeners();
        //  navigateToSharedData();
      }
    });

    // Handle initial shared data
    FlutterSharingIntent.instance.getInitialSharing().then((sharedMedia) {
      if (sharedMedia.isNotEmpty && sharedMedia.first.value != null) {
        sharedText = sharedMedia;
        isSharing = true;
        notifyListeners();
        // print(sharedMedia.first.value.runtimeType);
        //navigateToSharedData();
      }
    });
  }

  sendmesj(index) {
    for (SharedFile data in sharedText) {
      Messages msj = Messages(
        type: phototype,
        message: data.value,
        time: "",
        date: "",
      );
      AppFunctions()
          .add_msj(userlist[index].name!, userlist[index].phone!, msj);
    }
    isSharing = false;
    notifyListeners();
  }
  // void navigateToSharedData() {
  //   _NavigationService.navigateTo('/sharedDataView', arguments: sharedText);
  // }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: kcVeryLightGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: controller,
          hintText: hintText,
          keyboardType: keyboardType,
        ),
      ],
    );
  }

  adduser() {
    isadd = true;
    notifyListeners();
  }

  final _snackbarService = locator<SnackbarService>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> addUserButtonFunc(context) async {
    if (!_validateInputs()) return;

    try {
      final phoneNumber = int.parse(phoneController.text);
      final result =
          await AppFunctions().addUser(nameController.text, phoneNumber);

      if (result) {
        _snackbarService.showSnackbar(
          message: "Contact added successfully",
          duration: const Duration(seconds: 2),
        );
      } else {
        _snackbarService.showSnackbar(
          message: "Contact already exists",
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
        message: "Please enter a valid phone number",
        duration: const Duration(seconds: 2),
      );
    }
    isadd = false;
    notifyListeners();
  }

  bool _validateInputs() {
    if (nameController.text.trim().isEmpty) {
      _snackbarService.showSnackbar(
        message: "Please enter a name",
        duration: const Duration(seconds: 2),
      );
      return false;
    }

    if (phoneController.text.trim().isEmpty) {
      _snackbarService.showSnackbar(
        message: "Please enter a phone number",
        duration: const Duration(seconds: 2),
      );
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  gotoChat(index, context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChatView(userindex: index)));
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
