import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'verify_email_view.desktop.dart';
import 'verify_email_view.tablet.dart';
import 'verify_email_view.mobile.dart';
import 'verify_email_viewmodel.dart';

class VerifyEmailView extends StackedView<VerifyEmailViewModel> {
  const VerifyEmailView({super.key});

  @override
  Widget builder(
    BuildContext context,
    VerifyEmailViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const VerifyEmailViewMobile(),
      tablet: (_) => const VerifyEmailViewTablet(),
      desktop: (_) => const VerifyEmailViewDesktop(),
    );
  }

  @override
  VerifyEmailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyEmailViewModel();
}
