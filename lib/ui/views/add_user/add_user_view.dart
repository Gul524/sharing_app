import 'package:flutter/material.dart';
import 'package:sharing_app/ui/views/add_user/add_user_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddUserView extends StackedView<AddUserViewModel> {
   AddUserView({Key? key});
   
  @override
  Widget builder(
    BuildContext context,
    AddUserViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(

    );
  }
  
  @override
  AddUserViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    throw UnimplementedError();
  }
}