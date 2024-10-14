import 'package:flutter/material.dart';
import 'package:savage_client/ui/widgets/firebase_ui_auth/firebase_ui_auth_login/firebase_ui_auth_login.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginViewMobile extends ViewModelWidget<LoginViewModel> {
  const LoginViewMobile({super.key});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FirebaseUiAuthLogin(),
      ),
    );
  }
}
