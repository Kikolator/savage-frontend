import 'package:flutter/material.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/member_card/member_card_model.dart';
import 'package:savage_client/ui/widgets/common/profile_button/profile_button.dart';
import 'package:stacked/stacked.dart';

class MemberCard extends StackedView<MemberCardModel> {
  final MemberData memberData;
  const MemberCard({
    required this.memberData,
    super.key,
  });

  @override
  Widget builder(
      BuildContext context, MemberCardModel viewModel, Widget? child) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: InkWell(
        onTap: viewModel.showDetails,
        child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile pic
                  ProfileButton(
                    buttonActive: false,
                    photoUrl: memberData.photoUrl,
                  ),
                  horizontalSpaceMedium,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // verticalSpaceSmall,
                      // First and last name
                      Text(
                        '${memberData.firstName} ${memberData.lastName}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Company name
                      if (memberData.companyName != null &&
                          memberData.companyName!.isNotEmpty) ...[
                        Text(memberData.companyName!),
                      ],
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
                    ],
                  )
                ],
              ),
              // verticalSpaceSmall,
              // TODO categories
              verticalSpaceMedium,
              // Description
              Flexible(child: Text(memberData.description ?? ''))
            ],
          ),
        ),
      ),
    );
  }

  @override
  MemberCardModel viewModelBuilder(BuildContext context) =>
      MemberCardModel(memberData);
}
