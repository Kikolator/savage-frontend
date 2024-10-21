import 'package:flutter/material.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/views/create_business_profile/create_business_profile_view.form.dart';
import 'package:savage_client/ui/widgets/common/image_uploader/image_uploader.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_business_profile_viewmodel.dart';

// Business name
// description
// website
// socials
// profile pic
@FormView(fields: [
  FormTextField(name: 'companyName'),
  FormTextField(name: 'website'),
  FormTextField(name: 'description'),
  FormTextField(name: 'companyEmail'),
  FormTextField(name: 'companyPhone'),
], autoTextFieldValidation: false)
class CreateBusinessProfileView
    extends StackedView<CreateBusinessProfileViewModel>
    with $CreateBusinessProfileView {
  const CreateBusinessProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateBusinessProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset('assets/images/icon.png'),
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
      body: viewModel.isBusy
          ? const Loader()
          : SingleChildScrollView(
              child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpaceMedium,
                  // profile pic
                  const Text('Profile Picture:'),
                  Center(
                    child: ImageUploader(
                      imageUrl: viewModel.photoUrl,
                      onImageSelected: viewModel.onImageSelected,
                    ),
                  ),
                  verticalSpaceMedium,
                  // Company name
                  const Text('Company Name:'),
                  verticalSpaceSmall,
                  TextFormField(controller: companyNameController),
                  verticalSpaceMedium,
                  // website
                  const Text('Website:'),
                  verticalSpaceSmall,
                  TextFormField(controller: websiteController),
                  verticalSpaceMedium,
                  // Company phone
                  const Text('Company Phone:'),
                  verticalSpaceSmall,
                  TextFormField(controller: companyPhoneController),
                  verticalSpaceMedium,
                  // Company Email
                  const Text('Company Email:'),
                  verticalSpaceSmall,
                  TextFormField(controller: companyEmailController),
                  verticalSpaceMedium,
                  // description
                  const Text('Description:'),
                  verticalSpaceSmall,
                  TextFormField(
                    controller: descriptionController,
                    minLines: 1,
                    maxLines: 10,
                    maxLength: 500,
                  ),
                  verticalSpaceMedium,
                  // socials
                  // Profile visible to other members
                  SwitchListTile(
                    value: viewModel.memberVisisbleValue,
                    title: const Text('Profile visible to other members'),
                    onChanged: viewModel.onMemberVisibleValueChange,
                  ),
                  verticalSpaceMedium,
                  // Save button
                  ElevatedButton(
                    onPressed: viewModel.submit,
                    child: const Text('Save'),
                  ),
                  if (viewModel.hasError) ...[
                    verticalSpaceTiny,
                    Text(
                      viewModel.modelError,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    )
                  ],
                  verticalSpaceMedium,
                ],
              ),
            )),
    );
  }

  @override
  void onViewModelReady(CreateBusinessProfileViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.getUserData();
    super.onViewModelReady(viewModel);
  }

  @override
  CreateBusinessProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateBusinessProfileViewModel();
}
