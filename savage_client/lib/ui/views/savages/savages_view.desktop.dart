import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'savages_viewmodel.dart';

class SavagesViewDesktop extends ViewModelWidget<SavagesViewModel> {
  const SavagesViewDesktop({super.key});

  @override
  Widget build(BuildContext context, SavagesViewModel viewModel) {
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
