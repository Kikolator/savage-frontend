import 'package:flutter/material.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/dialogs/add_meeting_room/add_meeting_room_dialog.form.dart';
import 'package:savage_client/ui/widgets/common/image_uploader/image_uploader.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_meeting_room_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'description'),
  FormTextField(name: 'capacity'),
  FormDropdownField(
    name: 'active',
    items: [
      StaticDropdownItem(title: 'yes', value: 'true'),
      StaticDropdownItem(title: 'no', value: 'false'),
    ],
  ),
])
class AddMeetingRoomDialog extends StackedView<AddMeetingRoomDialogModel>
    with $AddMeetingRoomDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddMeetingRoomDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddMeetingRoomDialogModel viewModel,
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
                const Text('Add Meeting Room'),
                CloseButton(
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                )
              ],
            ),
            Divider(),
            verticalSpaceSmall,
            // Name
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                helperText: 'Meeting Room name',
              ),
            ),
            verticalSpaceSmall,
            // description
            TextFormField(
              controller: descriptionController,
              minLines: 1,
              maxLines: 10,
              maxLength: 500,
            ),
            verticalSpaceSmall,
            // capacity
            TextFormField(
              controller: capacityController,
              decoration: const InputDecoration(
                helperText: 'Capacity',
              ),
            ),
            verticalSpaceSmall,
            // active
            DropdownButtonFormField<String>(
                decoration: const InputDecoration(hintText: 'Active'),
                items: const [
                  DropdownMenuItem(value: 'true', child: Text('yes')),
                  DropdownMenuItem(value: 'false', child: Text('no')),
                ],
                onChanged: (value) =>
                    value != null ? viewModel.setActive(value) : null),
            verticalSpaceSmall,
            // photo url
            ImageUploader(
              onImageSelected: viewModel.onImageSelected,
            ),
            verticalSpaceMedium,
            // Button
            GestureDetector(
              onTap: () async {
                await viewModel.addMeetingRoom();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Add Meeting Room',
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
  onViewModelReady(AddMeetingRoomDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  AddMeetingRoomDialogModel viewModelBuilder(BuildContext context) =>
      AddMeetingRoomDialogModel();
}
