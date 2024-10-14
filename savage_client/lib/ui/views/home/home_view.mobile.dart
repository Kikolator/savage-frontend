import 'package:flutter/material.dart';
import 'package:savage_client/ui/widgets/common/profile_button/profile_button.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Savage Coworking'),
          actions: const [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileButton(),
            )
          ],
        ),
        drawer: const Drawer(),
        endDrawer: const Drawer(
          child: Text('hello end drawer'),
        ),
        body: ExtendedNavigator());
  }
}
