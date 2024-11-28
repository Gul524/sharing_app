import 'package:flutter/material.dart';
import 'package:sharing_app/services/functions.dart';
import 'package:stacked/stacked.dart';
import 'package:sharing_app/ui/common/app_colors.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: kcPrimaryColorDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "G.Chat",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: kcPrimaryColor),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //viewModel.incrementCounter();
                },
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: kcPrimaryColor,
                  foregroundColor: kcPrimaryColorDark,
                  child: Icon(
                    Icons.search,
                  ),
                )),
            IconButton(
                onPressed: () {
                  viewModel.adduser();
                },
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: kcPrimaryColor,
                  foregroundColor: kcPrimaryColorDark,
                  child: Icon(
                    Icons.add,
                  ),
                ))
          ],
        ),
        body: (userlist.isEmpty)
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Divider(
                    thickness: 2,
                    color: kcPrimaryColor,
                  ),
                  Center(
                    child: Text(
                      "No user Found",
                      style: TextStyle(fontSize: 30, color: kcPrimaryColor),
                    ),
                  ),
                  Text("")
                ],
              )
            : Column(
                children: [
                  const Divider(
                    thickness: 2,
                    color: kcPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        itemCount: userlist.length,
                        itemBuilder: (context, index) {
                          if (userlist.isNotEmpty) {
                            return const Text("data");
                          }
                          return null;
                        }),
                  ),
                ],
              ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
