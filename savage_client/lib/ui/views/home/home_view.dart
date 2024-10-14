import 'package:flutter/material.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/ui/views/overview/overview_view.dart';
import 'package:savage_client/ui/widgets/common/drawer_menu_button/drawer_menu_button.dart';
import 'package:savage_client/ui/widgets/common/profile_button/profile_button.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  static const String kOverviewViewTitle = 'Overview';
  static const String kSavagesViewTitle = 'Savages';
  static const String kHotDesksViewTitle = 'Hot Desks';
  static const String kMeetingRoomViewTitle = 'Meeting Room';
  static const String kBillingViewTitle = 'Billing';

  static const IconData kOverviewViewIconData = Icons.dashboard;
  static const IconData kSavagesViewIconData = Icons.groups_2;
  static const IconData kHotDesksViewIconData = Icons.laptop;
  static const IconData kMeetingRoomViewIconData = Icons.meeting_room;
  static const IconData kBillingViewIconData = Icons.credit_card;

  /// Overview
  /// Savages
  /// HotDesks
  /// MeetingRoom
  /// Billing
  List<DrawerMenuButton> _drawerItems(
          BuildContext context, HomeViewModel viewModel) =>
      [
        DrawerMenuButton(
          title: kOverviewViewTitle,
          icon: kOverviewViewIconData,
          route: const OverviewViewRoute(),
          selected: viewModel.currentIndex == 0,
          onSelected: () => viewModel.setIndex(0),
        ),
        DrawerMenuButton(
          title: kSavagesViewTitle,
          icon: kSavagesViewIconData,
          route: const SavagesViewRoute(),
          selected: viewModel.currentIndex == 1,
          onSelected: () => viewModel.setIndex(1),
        ),
        DrawerMenuButton(
          title: kHotDesksViewTitle,
          icon: kHotDesksViewIconData,
          route: const HotDesksViewRoute(),
          selected: viewModel.currentIndex == 2,
          onSelected: () => viewModel.setIndex(
            2,
          ),
        ),
        DrawerMenuButton(
          title: kMeetingRoomViewTitle,
          icon: kMeetingRoomViewIconData,
          route: const MeetingRoomViewRoute(),
          selected: viewModel.currentIndex == 3,
          onSelected: () => viewModel.setIndex(
            3,
          ),
        ),
        DrawerMenuButton(
          title: kBillingViewTitle,
          icon: kBillingViewIconData,
          route: const BillingViewRoute(),
          selected: viewModel.currentIndex == 4,
          onSelected: () => viewModel.setIndex(
            4,
          ),
        ),
      ];

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Savage Coworking'),
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
                    'assets/images/logo.png',
                  ),
                ),
              ),
            ),
            ..._drawerItems(context, viewModel)
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(children: [Text('')]),
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
