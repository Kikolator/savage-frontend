import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'verify_email_viewmodel.dart';

class VerifyEmailViewTablet extends ViewModelWidget<VerifyEmailViewModel> {
  const VerifyEmailViewTablet({super.key});

  @override
  Widget build(BuildContext context, VerifyEmailViewModel viewModel) {
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
