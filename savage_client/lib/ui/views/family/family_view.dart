import 'package:flutter/material.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:savage_client/ui/widgets/common/member_card/member_card.dart';
import 'package:savage_client/ui/widgets/common/profile_button/profile_button.dart';
import 'package:stacked/stacked.dart';

import 'family_viewmodel.dart';

class FamilyView extends StackedView<FamilyViewModel> {
  const FamilyView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FamilyViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Loader();
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceMedium,
          if (viewModel.userMemberData == null ||
              viewModel.userMemberData!.isEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: viewModel.navigateToCreateBusinessProfile,
                  child: const Text('Create Your Profile'),
                ),
              ],
            ),
          ] else ...[
            Row(
              children: [
                horizontalSpaceSmall,
                ProfileButton(
                  buttonActive: false,
                  photoUrl: viewModel.userMemberData?.photoUrl,
                ),
                horizontalSpaceSmall,
                Text(viewModel.userMemberData!.companyName ??
                    'Company name not set'),
                const Spacer(),
                TextButton(
                  onPressed: viewModel.editUserMemberData,
                  child: const Text('Edit'),
                ),
                horizontalSpaceSmall,
              ],
            ),
          ],
          const Divider(),
          if (viewModel.isActiveMember) ...[
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.workspaceMembers.length,
                itemBuilder: (context, index) {
                  final member = viewModel.workspaceMembers[index];
                  return MemberCard(memberData: member);
                },
              ),
            ),
          ] else ...[
            Center(
              child: Column(
                children: [
                  verticalSpaceMedium,
                  const Text('You are not a member of this workspace'),
                  verticalSpaceSmall,
                  const ElevatedButton(
                    onPressed: null,
                    child: Text('Subscribe Now'),
                  ),
                  verticalSpaceTiny,
                  TextButton(
                    onPressed: viewModel.alreadyAMember,
                    child: const Text('I\'m already a member'),
                  ),
                ],
              ),
            ),
          ],
          verticalSpaceMedium,
        ],
      ),
    );
  }

  @override
  void onViewModelReady(FamilyViewModel viewModel) {
    viewModel.getMemberData();
    super.onViewModelReady(viewModel);
  }

  @override
  FamilyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FamilyViewModel();
}