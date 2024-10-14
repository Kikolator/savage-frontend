import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'meeting_room_view.desktop.dart';
import 'meeting_room_view.tablet.dart';
import 'meeting_room_view.mobile.dart';
import 'meeting_room_viewmodel.dart';

class MeetingRoomView extends StackedView<MeetingRoomViewModel> {
  const MeetingRoomView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MeetingRoomViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const MeetingRoomViewMobile(),
      tablet: (_) => const MeetingRoomViewTablet(),
      desktop: (_) => const MeetingRoomViewDesktop(),
    );
  }

  @override
  MeetingRoomViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MeetingRoomViewModel();
}
