import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'firebase_ui_auth_login_model.dart';

class FirebaseUiAuthLogin extends StackedView<FirebaseUiAuthLoginModel> {
  const FirebaseUiAuthLogin({super.key});

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
        providers: FirebaseUIAuth.providersFor(
          FirebaseAuth.instance.app,
        ),
        auth: viewModel.auth,
      ),
    );
  }

  @override
  FirebaseUiAuthLoginModel viewModelBuilder(
    BuildContext context,
  ) =>
      FirebaseUiAuthLoginModel();
}
