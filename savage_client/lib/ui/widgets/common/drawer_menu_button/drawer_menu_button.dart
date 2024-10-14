import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'drawer_menu_button_model.dart';

class DrawerMenuButton extends StackedView<DrawerMenuButtonModel> {
  final PageRouteInfo route;
  final bool selected;
  final String title;
  final IconData icon;
  final void Function() onSelected;

  const DrawerMenuButton({
    required this.route,
    required this.selected,
    required this.title,
    required this.icon,
    required this.onSelected,
    super.key,
  });

  @override
  Widget builder(
    BuildContext context,
    DrawerMenuButtonModel viewModel,
    Widget? child,
  ) {
    return ListTile(
      selected: selected,
      onTap: () {
        Scaffold.of(context).hasEndDrawer ||
                Scaffold.of(context).isEndDrawerOpen
            ? Navigator.of(context).pop()
            : null;
        onSelected();
        viewModel.navigateToRoute(route);
      },
      leading: Icon(icon),
      title: Text(
        title,
      ),
    );
  }

  @override
  DrawerMenuButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      DrawerMenuButtonModel();
}
