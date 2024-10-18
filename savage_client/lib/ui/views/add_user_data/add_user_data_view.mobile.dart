import 'package:flutter/material.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_view.form.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';

import 'add_user_data_viewmodel.dart';

class AddUserDataViewMobile extends ViewModelWidget<AddUserDataViewModel>
    with $AddUserDataView {
  const AddUserDataViewMobile({super.key});

  @override
  Widget build(BuildContext context, AddUserDataViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('How do we reach you?'),
      ),
      body: viewModel.isBusy
          ? const Center(child: Loader())
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    const Text('First name:'),
                    verticalSpaceSmall,
                    TextFormField(controller: firstNameController),
                    if (viewModel.showValidationMessages &&
                        viewModel.hasFirstNameValidationMessage) ...[
                      verticalSpaceTiny,
                      Text(
                        viewModel.firstNameValidationMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceMedium,
                    const Text('Last name:'),
                    verticalSpaceSmall,
                    TextFormField(controller: lastNameController),
                    if (viewModel.showValidationMessages &&
                        viewModel.hasLastNameValidationMessage) ...[
                      verticalSpaceTiny,
                      Text(
                        viewModel.lastNameValidationMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceMedium,
                    const Text('Contact email:'),
                    verticalSpaceSmall,
                    TextFormField(
                      controller: contactEmailController,
                    ),
                    if (viewModel.showValidationMessages &&
                        viewModel.hasContactEmailValidationMessage) ...[
                      verticalSpaceTiny,
                      Text(
                        viewModel.contactEmailValidationMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceMedium,
                    const Text('Contact phone number:'),
                    const Text(
                      'include international code eg: +34612345678',
                      style: TextStyle(color: Colors.grey),
                    ),
                    verticalSpaceSmall,
                    TextFormField(
                      controller: contactPhoneController,
                    ),
                    if (viewModel.showValidationMessages &&
                        viewModel.hasContactPhoneValidationMessage) ...[
                      verticalSpaceTiny,
                      Text(
                        viewModel.contactPhoneValidationMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceMedium,
                    const Text('Whatsapp number (optional):'),
                    const Text(
                      'In case different from contact phone number',
                      style: TextStyle(color: Colors.grey),
                    ),
                    verticalSpaceSmall,
                    TextFormField(controller: phoneWhatsappController),
                    if (viewModel.showValidationMessages &&
                        viewModel.hasPhoneWhatsappValidationMessage) ...[
                      verticalSpaceTiny,
                      Text(
                        viewModel.phoneWhatsappValidationMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceLarge,
                    ElevatedButton(
                      onPressed: viewModel.submitForm,
                      child: const Text('Submit'),
                    ),
                    if (viewModel.hasError) ...[
                      verticalSpaceTiny,
                      Text(
                        viewModel.modelError.toString(),
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceLarge,
                  ],
                ),
              ),
            ),
    );
  }
}
