import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'verify_email_viewmodel.dart';

class VerifyEmailViewDesktop extends ViewModelWidget<VerifyEmailViewModel> {
  const VerifyEmailViewDesktop({super.key});

  @override
  Widget build(BuildContext context, VerifyEmailViewModel viewModel) {
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
