import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_validators.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_view.form.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_user_data_viewmodel.dart';

/// View takes user data:
/// First and last name,
/// contact email for invoicing and coworking business,
/// does user wnat to be added to whatsapp group,
/// whatsapp number for Wapp group,
@FormView(fields: [
  FormTextField(
    name: 'firstName',
    validator: AddUserDataValidators.validateFirstName,
  ),
  FormTextField(
      name: 'lastName', validator: AddUserDataValidators.validateLastName),
  FormDateField(name: 'dob'),
  FormTextField(
      name: 'contactPhone',
      validator: AddUserDataValidators.validateContactPhone),
  FormTextField(
      name: 'phoneWhatsapp',
      validator: AddUserDataValidators.validatePhoneWhatsapp),
])
class AddUserDataView extends StackedView<AddUserDataViewModel>
    with $AddUserDataView {
  const AddUserDataView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AddUserDataViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Scaffold(body: Loader());
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Image.asset('assets/images/icon.png'),
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
                    // first name
                    // const Text('First name:'),
                    // verticalSpaceSmall,
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First name',
                        border: OutlineInputBorder(),
                      ),
                    ),
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
                    // Last name
                    // const Text('Last name:'),
                    // verticalSpaceSmall,
                    TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last name',
                        border: OutlineInputBorder(),
                      ),
                    ),
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
                    // Date of birth
                    Row(children: [
                      const Text('Date of birth:'),
                      horizontalSpaceSmall,
                      FilledButton(
                          onPressed: () => viewModel.selectDob(
                                context: context,
                                initialDate: DateTime(1989, 9, 20),
                                firstDate: DateTime(1901, 1, 1),
                                lastDate: DateTime(DateTime.now().year - 18,
                                    DateTime.now().month, DateTime.now().day),
                              ),
                          child: Text(viewModel.hasDob
                              ? DateFormat.yMMMd().format(viewModel.dobValue!)
                              : 'Set date of birth')),
                    ]),
                    if (viewModel.showValidationMessages &&
                        !viewModel.hasDob) ...[
                      verticalSpaceTiny,
                      const Text(
                        'Date of birth is required',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceMedium,
                    // contact phone
                    // const Text('Contact phone number:'),
                    // verticalSpaceSmall,
                    TextFormField(
                      controller: contactPhoneController,
                      decoration: const InputDecoration(
                        labelText: 'Contact phone number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text(
                      'include international code eg: +34612345678',
                      style: TextStyle(color: Colors.grey),
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
                    // whatsapp phone
                    // const Text('Whatsapp number (optional):'),
                    // verticalSpaceSmall,
                    TextFormField(
                      controller: phoneWhatsappController,
                      decoration: const InputDecoration(
                        labelText: 'Whatsapp number (optional)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text(
                      'In case different from contact phone number',
                      style: TextStyle(color: Colors.grey),
                    ),
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
                    verticalSpaceMedium,
                    // Terms and conditions
                    Row(children: [
                      Checkbox(
                        value: viewModel.termsAccepted,
                        onChanged: viewModel.acceptTerms,
                      ),
                      horizontalSpaceSmall,
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text: 'I accept the Savage Coworking '),
                          TextSpan(
                              text: 'Terms & Conditions',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    viewModel.navigateToTermsAndConditions),
                          const TextSpan(text: '.'),
                        ]),
                      ),
                    ]),
                    if (viewModel.showValidationMessages &&
                        !viewModel.termsAccepted) ...[
                      verticalSpaceTiny,
                      const Text(
                        'Please accept the terms and conditions',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                    verticalSpaceLarge,
                    // submit button
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

  @override
  AddUserDataViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddUserDataViewModel();

  @override
  void onViewModelReady(AddUserDataViewModel viewModel) async {
    syncFormWithViewModel(viewModel);
    await viewModel.initialise();
  }

  @override
  void onDispose(AddUserDataViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
