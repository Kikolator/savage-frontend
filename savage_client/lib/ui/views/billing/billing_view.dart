import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'billing_view.desktop.dart';
import 'billing_view.tablet.dart';
import 'billing_view.mobile.dart';
import 'billing_viewmodel.dart';

class BillingView extends StackedView<BillingViewModel> {
  const BillingView({super.key});

  @override
  Widget builder(
    BuildContext context,
    BillingViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const BillingViewMobile(),
      tablet: (_) => const BillingViewTablet(),
      desktop: (_) => const BillingViewDesktop(),
    );
  }

  @override
  BillingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BillingViewModel();
}
