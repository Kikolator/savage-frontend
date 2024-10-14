import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'savages_viewmodel.dart';

class SavagesViewTablet extends ViewModelWidget<SavagesViewModel> {
  const SavagesViewTablet({super.key});

  @override
  Widget build(BuildContext context, SavagesViewModel viewModel) {
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
