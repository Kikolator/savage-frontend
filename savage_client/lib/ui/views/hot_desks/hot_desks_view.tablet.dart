import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'hot_desks_viewmodel.dart';

class HotDesksViewTablet extends ViewModelWidget<DesksViewModel> {
  const HotDesksViewTablet({super.key});

  @override
  Widget build(BuildContext context, DesksViewModel viewModel) {
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
