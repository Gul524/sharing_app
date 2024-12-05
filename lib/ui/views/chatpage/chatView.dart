import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sharing_app/customWidgets/textfield.dart';
import 'package:sharing_app/models/chatmodel.dart';
import 'package:sharing_app/services/functions.dart';
import 'package:sharing_app/ui/common/app_colors.dart';
import 'package:sharing_app/ui/views/chatpage/chatViewModel.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StackedView<ChatViewModel> {
  final int userindex;
  const ChatView({super.key, required this.userindex});

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: kcPrimaryColorDark,
        foregroundColor: kcPrimaryColor,
        title: Text(userlist[userindex].name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            reverse: true,
            itemCount: userlist[userindex].messages!.length,
            itemBuilder: (context, index) {
              int reverseIndex =
                  userlist[userindex].messages!.length - 1 - index;
              final Messages msjlist =
                  userlist[userindex].messages![reverseIndex];
              return Align(
                alignment: msjlist.type == texttype
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: GestureDetector(
                  onLongPress: () {
                    userlist[userindex].messages!.removeAt(reverseIndex);
                    viewModel.notifyListeners();
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msjlist.type == texttype
                          ? kcPrimaryColor
                          : kcPrimaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: msjlist.type == phototype
                        ? SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.file(File(msjlist.message!)),
                          )
                        : Text(
                            msjlist.message!,
                            style: const TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: "Message",
                controller: viewModel.msjj,
              ),
            ),
            const SizedBox(width: 8),
            FloatingActionButton(
              backgroundColor: kcPrimaryColor,
              child: const Icon(
                Icons.send,
                color: kcPrimaryColorDark,
              ),
              onPressed: () {
                if (viewModel.msjj.text.trim().isNotEmpty) {
                  viewModel.addmessage(userindex, texttype);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel();
}
