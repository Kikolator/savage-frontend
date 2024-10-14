import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_user_data_viewmodel.dart';

class AddUserDataViewTablet extends ViewModelWidget<AddUserDataViewModel> {
  const AddUserDataViewTablet({super.key});

  @override
  Widget build(BuildContext context, AddUserDataViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
