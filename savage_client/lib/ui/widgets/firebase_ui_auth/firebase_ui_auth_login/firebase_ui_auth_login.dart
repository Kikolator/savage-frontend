import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'firebase_ui_auth_login_model.dart';

class FirebaseUiAuthLogin extends StackedView<FirebaseUiAuthLoginModel> {
  final String? errorMessage;
  final Function(bool)? onLoginCallback;
  const FirebaseUiAuthLogin(
      {required this.errorMessage, required this.onLoginCallback, super.key});

  @override
  Widget builder(
    BuildContext context,
    FirebaseUiAuthLoginModel viewModel,
    Widget? child,
  ) {
    return FirebaseUIActions(
      actions: [
        AuthStateChangeAction<UserCreated>((context, state) async {
          viewModel.userCreated();
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            viewModel.userEmailNotVerified();
          } else {
            viewModel.userEmailVerified();
          }
        }),
      ],
      child: LoginView(
        action: AuthAction.signUp,
        showPasswordVisibilityToggle: true,
        footerBuilder: errorMessage != null
            ? (context, action) => Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                )
            : null,
        providers: FirebaseUIAuth.providersFor(
          FirebaseAuth.instance.app,
        ),
        auth: viewModel.auth,
      ),
    );
  }

  @override
  void onViewModelReady(FirebaseUiAuthLoginModel viewModel) {
    viewModel.onLoginCallback = onLoginCallback;
    super.onViewModelReady(viewModel);
  }

  @override
  FirebaseUiAuthLoginModel viewModelBuilder(
    BuildContext context,
  ) =>
      FirebaseUiAuthLoginModel();
}
