import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_validators.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_view.form.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_user_data_view.desktop.dart';
import 'add_user_data_view.tablet.dart';
import 'add_user_data_view.mobile.dart';
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
  FormTextField(
      name: 'contactEmail',
      validator: AddUserDataValidators.validateContactEmail),
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
      return const Loader();
    }
    return ScreenTypeLayout.builder(
      mobile: (_) => const AddUserDataViewMobile(),
      tablet: (_) => const AddUserDataViewTablet(),
      desktop: (_) => const AddUserDataViewDesktop(),
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
    contactEmailController.text = viewModel.contactEmail;
  }

  @override
  void onDispose(AddUserDataViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
