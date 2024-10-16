import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'invoices_view.desktop.dart';
import 'invoices_view.tablet.dart';
import 'invoices_view.mobile.dart';
import 'invoices_viewmodel.dart';

class InvoicesView extends StackedView<InvoicesViewModel> {
  const InvoicesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    InvoicesViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const InvoicesViewMobile(),
      tablet: (_) => const InvoicesViewTablet(),
      desktop: (_) => const InvoicesViewDesktop(),
    );
  }

  @override
  InvoicesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InvoicesViewModel();
}
