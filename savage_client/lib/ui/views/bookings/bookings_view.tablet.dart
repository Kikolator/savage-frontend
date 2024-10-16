import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bookings_viewmodel.dart';

class BookingsViewTablet extends ViewModelWidget<BookingsViewModel> {
  const BookingsViewTablet({super.key});

  @override
  Widget build(BuildContext context, BookingsViewModel viewModel) {
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
