import 'package:flutter/material.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:savage_client/ui/widgets/firebase_ui_auth/firebase_ui_auth_login/firebase_ui_auth_login.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  final Function(bool loggedIn)? onLoginCallback;
  const LoginView({this.onLoginCallback, super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Loader();
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FirebaseUiAuthLogin(
          errorMessage: viewModel.modelError,
          onLoginCallback: onLoginCallback,
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) async {
    await viewModel.checkIfUserIsSignedIn();
    super.onViewModelReady(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
