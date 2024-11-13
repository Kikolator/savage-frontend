import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/dialogs/add_desk/add_desk_dialog.form.dart';
import 'package:savage_client/ui/widgets/common/image_uploader/image_uploader.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_desk_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'number'),
  FormDropdownField(name: 'type', items: [
    StaticDropdownItem(title: 'flexible', value: 'flexible'),
    StaticDropdownItem(title: 'fixed', value: 'fixed'),
  ]),
  FormDropdownField(
    name: 'workspace',
    items: [
      StaticDropdownItem(title: 'Av. España', value: '0001'),
    ],
  ),
  FormDropdownField(
    name: 'available',
    items: [
      StaticDropdownItem(title: 'yes', value: 'true'),
      StaticDropdownItem(title: 'no', value: 'false'),
    ],
  ),
  FormTextField(name: 'assigned to'),
  FormDateField(name: 'assigned until'),
])
class AddDeskDialog extends StackedView<AddDeskDialogModel>
    with $AddDeskDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddDeskDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddDeskDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add Desk'),
                CloseButton(
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                )
              ],
            ),
            Divider(),
            verticalSpaceSmall,
            // Desk number (string)
            TextFormField(
              controller: numberController,
              decoration: const InputDecoration(
                helperText: 'Desk number',
              ),
            ),
            verticalSpaceSmall,
            // Desk type (flexible | fixed)
            DropdownButtonFormField<String>(
                decoration: const InputDecoration(hintText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'flexible', child: Text('flexible')),
                  DropdownMenuItem(value: 'fixed', child: Text('fixed')),
                ],
                onChanged: (value) =>
                    value != null ? viewModel.setType(value) : null),
            verticalSpaceSmall,
            // Available (bool)
            DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'true', child: Text('yes')),
                  DropdownMenuItem(value: 'false', child: Text('no')),
                ],
                onChanged: (value) =>
                    value != null ? viewModel.setAvailable(value) : null),
            verticalSpaceSmall,
            // Assigned to (uid | null)
            TextFormField(
              controller: assignedToController,
              decoration: const InputDecoration(hintText: 'Assigned to'),
            ),
            verticalSpaceSmall,
            // assigned until (DateTime | null)
            ElevatedButton(
                onPressed: () => viewModel.selectAssignedUntil(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    ),
                child: viewModel.assignedUntilValue != null
                    ? Text(
                        '${DateFormat.yMEd().format(viewModel.assignedUntilValue!)},')
                    : const Text('Pick date')),
            verticalSpaceSmall,
            // photo url
            ImageUploader(
              onImageSelected: viewModel.onImageSelected,
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: () async {
                await viewModel.addDesk();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: viewModel.isBusy
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Add Desk',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
            if (viewModel.succesMessage != null) ...[
              verticalSpaceTiny,
              Text(viewModel.succesMessage!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.green)),
            ],
            if (viewModel.hasError) ...[
              verticalSpaceTiny,
              Text(viewModel.modelError,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(AddDeskDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  AddDeskDialogModel viewModelBuilder(BuildContext context) =>
      AddDeskDialogModel();
}
