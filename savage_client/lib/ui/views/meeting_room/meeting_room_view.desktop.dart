import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'meeting_room_viewmodel.dart';

class MeetingRoomViewDesktop extends ViewModelWidget<MeetingRoomViewModel> {
  const MeetingRoomViewDesktop({super.key});

  @override
  Widget build(BuildContext context, MeetingRoomViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
