import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'meeting_room_viewmodel.dart';

class MeetingRoomViewTablet extends ViewModelWidget<MeetingRoomViewModel> {
  const MeetingRoomViewTablet({super.key});

  @override
  Widget build(BuildContext context, MeetingRoomViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
