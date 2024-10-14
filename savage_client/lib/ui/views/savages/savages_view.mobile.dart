import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'savages_viewmodel.dart';

class SavagesViewMobile extends ViewModelWidget<SavagesViewModel> {
  const SavagesViewMobile({super.key});

  @override
  Widget build(BuildContext context, SavagesViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
