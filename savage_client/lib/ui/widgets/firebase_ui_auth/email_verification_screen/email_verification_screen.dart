import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savage_client/env.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase_ui_auth;

import 'email_verification_screen_model.dart';

class EmailVerificationScreen
    extends StackedView<EmailVerificationScreenModel> {
  const EmailVerificationScreen({super.key});

  @override
  Widget builder(
    BuildContext context,
    EmailVerificationScreenModel viewModel,
    Widget? child,
  ) {
    return firebase_ui_auth.EmailVerificationScreen(
      actionCodeSettings: ActionCodeSettings(
        url: Env.actionCodeUrl,
      ),
      actions: [
        firebase_ui_auth.EmailVerifiedAction(() {
          viewModel.onEmailVerified();
        }),
        firebase_ui_auth.AuthCancelledAction((context) {
          viewModel.onAuthCancelled();
        }),
      ],
    );
  }

  @override
  EmailVerificationScreenModel viewModelBuilder(
    BuildContext context,
  ) =>
      EmailVerificationScreenModel();
}
