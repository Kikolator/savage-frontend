import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'hot_desks_view.desktop.dart';
import 'hot_desks_view.tablet.dart';
import 'hot_desks_view.mobile.dart';
import 'hot_desks_viewmodel.dart';

class HotDesksView extends StackedView<DesksViewModel> {
  const HotDesksView({super.key});

  @override
  Widget builder(
    BuildContext context,
    DesksViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const HotDesksViewMobile(),
      tablet: (_) => const HotDesksViewTablet(),
      desktop: (_) => const HotDesksViewDesktop(),
    );
  }

  @override
  void onViewModelReady(DesksViewModel viewModel) async {
    await viewModel.fetchHotDesks();
    super.onViewModelReady(viewModel);
  }

  @override
  DesksViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DesksViewModel();
}
