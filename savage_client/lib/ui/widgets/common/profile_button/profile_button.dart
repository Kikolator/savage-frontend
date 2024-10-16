import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_button_model.dart';

class ProfileButton extends StackedView<ProfileButtonModel> {
  final bool buttonActive;
  const ProfileButton({this.buttonActive = true, super.key});

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
        height: 50,
        width: 50,
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
  ProfileButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileButtonModel();
}
