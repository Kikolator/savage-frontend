import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bookings_viewmodel.dart';

class BookingsViewDesktop extends ViewModelWidget<BookingsViewModel> {
  const BookingsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, BookingsViewModel viewModel) {
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
