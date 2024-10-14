import 'package:flutter/material.dart';
import 'package:savage_client/ui/widgets/firebase_ui_auth/email_verification_screen/email_verification_screen.dart';
import 'package:stacked/stacked.dart';

import 'verify_email_viewmodel.dart';

class VerifyEmailViewMobile extends ViewModelWidget<VerifyEmailViewModel> {
  const VerifyEmailViewMobile({super.key});

  @override
  Widget build(BuildContext context, VerifyEmailViewModel viewModel) {
    return const EmailVerificationScreen();
  }
}
