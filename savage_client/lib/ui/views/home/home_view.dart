import 'package:flutter/material.dart';
import 'package:savage_client/ui/views/overview/overview_view.dart';
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
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: Image.asset(
                    'assets/images/icon.png',
                  ),
                ),
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
            const DrawerHeader(
              child: Row(
                children: [
                  // Profile picture
                  ProfileButton(
                    buttonActive: false,
                  ),
                  Column(
                    children: [
                      // Firstname Lastname
                      // Email
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
              trailing: IconButton(
                onPressed: viewModel.checkInOut,
                icon: Icon(viewModel.checkedIn ? Icons.logout : Icons.login),
              ),
            ),
            const Divider(),
            ...viewModel.endDrawerItems(),
          ],
        ),
      ),
      body: NestedRouter(
        builder: (context, child) => child,
        placeholder: (_) => const OverviewView(),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
