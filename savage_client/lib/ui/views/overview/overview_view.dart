import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'overview_viewmodel.dart';

class OverviewView extends StackedView<OverviewViewModel> {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OverviewViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      child: Center(
        child: Text('This is the overview'),
      ),
    );
  }

  @override
  OverviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OverviewViewModel();
}
