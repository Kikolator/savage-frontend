import 'package:flutter/material.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/profile_button/profile_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'member_card_dialog_model.dart';

class MemberCardDialog extends StackedView<MemberCardDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const MemberCardDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MemberCardDialogModel viewModel,
    Widget? child,
  ) {
    final memberData = request.data;
    if (memberData == null) {
      throw Exception('Member data is required');
    }
    if (memberData is! MemberData) {
      throw Exception('memberData must be of type MemberData');
    }
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              left: 12.0,
              top: 8.0,
            ),
            child: Row(
              children: [
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => completer.call(DialogResponse()),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
          ),
          const Divider(
            height: 8,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileButton(
                      buttonActive: false,
                      photoUrl: memberData.photoUrl,
                      size: 100,
                    ),
                    Text(
                      '${memberData.firstName} ${memberData.lastName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (memberData.companyName != null &&
                        memberData.companyName!.isNotEmpty) ...[
                      Text(memberData.companyName!),
                    ],
                    verticalSpaceMedium,
                    // Contact buttons
                    Row(
                      children: [
                        if (memberData.website != null &&
                            memberData.website!.isNotEmpty) ...[
                          IconButton(
                            icon: const Icon(Icons.language),
                            color: Theme.of(context).primaryColor,
                            onPressed: viewModel.navigateToWebsite,
                          ),
                        ],
                        if (memberData.companyEmail != null &&
                            memberData.companyEmail!.isNotEmpty) ...[
                          IconButton(
                            icon: const Icon(Icons.email),
                            color: Theme.of(context).primaryColor,
                            onPressed: viewModel.sendEmail,
                          ),
                        ],
                        if (memberData.companyPhone != null &&
                            memberData.companyPhone!.isNotEmpty) ...[
                          IconButton(
                            icon: const Icon(Icons.phone),
                            color: Theme.of(context).primaryColor,
                            onPressed: viewModel.callToPhone,
                          ),
                        ],
                      ],
                    ),
                    const Divider(),
                    verticalSpaceMedium,
                    Flexible(
                      child: Text(memberData.description ?? ''),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              left: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (viewModel.isUserCard) ...[
                  TextButton(
                    onPressed: viewModel.editProfile,
                    child: const Text('Edit'),
                  ),
                ] else ...[
                  const Spacer(),
                ],
                ElevatedButton(
                  onPressed: () => completer.call(DialogResponse()),
                  child: const Text('Close'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  MemberCardDialogModel viewModelBuilder(BuildContext context) =>
      MemberCardDialogModel(request.data as MemberData);
}
