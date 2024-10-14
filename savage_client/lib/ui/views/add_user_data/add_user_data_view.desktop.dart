import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_user_data_viewmodel.dart';

class AddUserDataViewDesktop extends ViewModelWidget<AddUserDataViewModel> {
  const AddUserDataViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AddUserDataViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
