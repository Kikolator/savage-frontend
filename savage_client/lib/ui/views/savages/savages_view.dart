import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'savages_view.desktop.dart';
import 'savages_view.tablet.dart';
import 'savages_view.mobile.dart';
import 'savages_viewmodel.dart';

class SavagesView extends StackedView<SavagesViewModel> {
  const SavagesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SavagesViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SavagesViewMobile(),
      tablet: (_) => const SavagesViewTablet(),
      desktop: (_) => const SavagesViewDesktop(),
    );
  }

  @override
  SavagesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SavagesViewModel();
}
