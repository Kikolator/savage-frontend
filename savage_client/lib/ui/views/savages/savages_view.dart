import 'package:flutter/material.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';

import 'savages_viewmodel.dart';

class SavagesView extends StackedView<SavagesViewModel> {
  const SavagesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SavagesViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Loader();
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceMedium,
          if (viewModel.memberData.isEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: viewModel.navigateToCreateBusinessProfile,
                  child: const Text('Create Your Profile'),
                ),
              ],
            ),
          ]
        ],
      ),
    ));
  }

  @override
  void onViewModelReady(SavagesViewModel viewModel) async {
    await viewModel.setMemberData();
    super.onViewModelReady(viewModel);
  }

  @override
  SavagesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SavagesViewModel();
}
