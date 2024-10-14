import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'hot_desks_viewmodel.dart';

class HotDesksViewDesktop extends ViewModelWidget<DesksViewModel> {
  const HotDesksViewDesktop({super.key});

  @override
  Widget build(BuildContext context, DesksViewModel viewModel) {
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
