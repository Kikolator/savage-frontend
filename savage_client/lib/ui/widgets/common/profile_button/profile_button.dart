import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_button_model.dart';

class ProfileButton extends StackedView<ProfileButtonModel> {
  final bool buttonActive;
  final String? photoUrl;
  final double? size;
  const ProfileButton(
      {this.buttonActive = true, this.photoUrl, this.size = 50, super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileButtonModel viewModel,
    Widget? child,
  ) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: buttonActive
          ? () {
              Scaffold.of(context).openEndDrawer();
            }
          : null,
      child: Container(
        height: size,
        width: size,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: viewModel.photoUrl != null
            ? Image.network(viewModel.photoUrl!)
            : Icon(
                Icons.person,
                size: 50,
              ),
      ),
    );
  }

  @override
  void onViewModelReady(ProfileButtonModel viewModel) {
    viewModel.setPhotoUrl(photoUrl);
    super.onViewModelReady(viewModel);
  }

  @override
  ProfileButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileButtonModel();
}
