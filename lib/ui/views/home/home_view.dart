import 'package:flutter/material.dart';
import 'package:sharing_app/customWidgets/listtiles.dart';
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
    return (viewModel.isSharing)
        ? (viewModel.isadd)
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: kcPrimaryColorDark,
                  title: const Text(
                    "Add User",
                    style: TextStyle(color: kcPrimaryColor),
                  ),
                ),
                backgroundColor: kcPrimaryColorDark,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        viewModel.buildInputField(
                          label: "Name",
                          controller: viewModel.nameController,
                          hintText: "Enter name",
                        ),
                        const SizedBox(height: 20),
                        viewModel.buildInputField(
                          label: "Phone",
                          controller: viewModel.phoneController,
                          hintText: "Enter phone number",
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.addUserButtonFunc(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kcPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text(
                              "Add User",
                              style: TextStyle(color: kcPrimaryColorDark),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.isadd = false;
                              viewModel.notifyListeners();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kcPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text(
                              "Skip",
                              style: TextStyle(color: kcPrimaryColorDark),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: kcPrimaryColorDark,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text(
                    "Select to send",
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
                              style: TextStyle(
                                  fontSize: 30, color: kcPrimaryColor),
                            ),
                          ),
                          Text("")
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.builder(
                            itemCount: userlist.length,
                            itemBuilder: (context, index) {
                              int reverseIndex = userlist.length - 1 - index;
                              final list = userlist[reverseIndex];

                              return Custom3DListTile(
                                name: list.name!,
                                phone: "${list.phone}",
                                onTap: () {
                                  viewModel.sendmesj(reverseIndex);
                                  viewModel.gotoChat(reverseIndex, context);
                                },
                                onlongpress: () {},
                                ondeletepress: () {},
                                edit: viewModel.editable,
                              );
                            }),
                      ))
        : (viewModel.isadd)
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: kcPrimaryColorDark,
                  title: const Text(
                    "Add User",
                    style: TextStyle(color: kcPrimaryColor),
                  ),
                ),
                backgroundColor: kcPrimaryColorDark,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        viewModel.buildInputField(
                          label: "Name",
                          controller: viewModel.nameController,
                          hintText: "Enter name",
                        ),
                        const SizedBox(height: 20),
                        viewModel.buildInputField(
                          label: "Phone",
                          controller: viewModel.phoneController,
                          hintText: "Enter phone number",
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.addUserButtonFunc(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kcPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text(
                              "Add User",
                              style: TextStyle(color: kcPrimaryColorDark),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.isadd = false;
                              viewModel.notifyListeners();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kcPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text(
                              "Skip",
                              style: TextStyle(color: kcPrimaryColorDark),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
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
                              style: TextStyle(
                                  fontSize: 30, color: kcPrimaryColor),
                            ),
                          ),
                          Text("")
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.builder(
                            itemCount: userlist.length,
                            itemBuilder: (context, index) {
                              int reverseIndex = userlist.length - 1 - index;
                              final list = userlist[reverseIndex];

                              return Custom3DListTile(
                                name: list.name!,
                                phone: "${list.phone}",
                                onTap: () {
                                  viewModel.gotoChat(reverseIndex, context);
                                },
                                onlongpress: () {
                                  viewModel.editable = true;
                                  viewModel.notifyListeners();
                                },
                                ondeletepress: () {
                                  userlist.removeAt(index);
                                  viewModel.editable = false;
                                  viewModel.notifyListeners();
                                },
                                edit: viewModel.editable,
                              );
                            }),
                      ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
