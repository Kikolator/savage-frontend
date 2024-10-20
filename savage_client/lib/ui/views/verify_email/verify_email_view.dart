import 'package:flutter/material.dart';
import 'package:savage_client/ui/widgets/firebase_ui_auth/email_verification_screen/email_verification_screen.dart';
import 'package:stacked/stacked.dart';

import 'verify_email_viewmodel.dart';

class VerifyEmailView extends StackedView<VerifyEmailViewModel> {
  const VerifyEmailView({super.key});

  @override
  Widget builder(
    BuildContext context,
    VerifyEmailViewModel viewModel,
    Widget? child,
  ) {
    return const EmailVerificationScreen();
  }

  @override
  VerifyEmailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyEmailViewModel();
}
