import 'package:flutter/material.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_business_profile_viewmodel.dart';

@FormView(fields: [])
class CreateBusinessProfileView
    extends StackedView<CreateBusinessProfileViewModel> {
  const CreateBusinessProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateBusinessProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Create Your Business Profile'),
          centerTitle: false,
          actions: [
            TextButton(
                onPressed: viewModel.skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(),
                ))
          ]),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceMedium,
          // User name
          // Business name
          // description
          // website
          // socials
          // profile pic
          verticalSpaceMedium,
        ],
      )),
    );
  }

  @override
  CreateBusinessProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateBusinessProfileViewModel();
}
