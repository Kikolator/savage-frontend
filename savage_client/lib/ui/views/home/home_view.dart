import 'package:flutter/material.dart';
import 'package:savage_client/env.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:savage_client/ui/widgets/common/profile_button/profile_button.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Scaffold(body: Loader());
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset('assets/images/logo.png',
            width: 100, fit: BoxFit.contain),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ProfileButton(),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: Image.asset(
                        'assets/images/icon-light.png',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(Env.kVersionNumber,
                        style: const TextStyle(
                          fontSize: 10,
                        )),
                  ),
                ],
              ),
            ),
            ...viewModel.drawerItems(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile picture
                  const ProfileButton(
                    buttonActive: false,
                  ),
                  horizontalSpaceSmall,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Firstname Lastname
                      Text(
                        '${viewModel.firstName} ${viewModel.lastName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Email
                      Text(viewModel.signupEmail),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: viewModel.checkedIn ? Colors.green : Colors.grey,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.checkedIn ? 'Checked In' : 'Checked Out',
                    style: TextStyle(
                      color: viewModel.checkedIn ? Colors.black : Colors.grey,
                    ),
                  ),
                  Text(
                    'Av. España',
                    style: TextStyle(
                      color: viewModel.checkedIn ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
              trailing: viewModel.busy(HomeViewModel.kCheckInOutBusyObject)
                  ? const CircularProgressIndicator()
                  : IconButton(
                      onPressed: viewModel.checkInOut,
                      icon: Icon(
                          viewModel.checkedIn ? Icons.logout : Icons.login),
                    ),
            ),
            const Divider(),
            ...viewModel.endDrawerItems(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: viewModel.logOut,
            ),
          ],
        ),
      ),
      body: NestedRouter(
        builder: (context, child) => child,
        // placeholder: (_) => const OverviewView(),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) async {
    await viewModel.fetchUser();
    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
