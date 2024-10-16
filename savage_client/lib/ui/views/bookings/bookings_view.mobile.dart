import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bookings_viewmodel.dart';

class BookingsViewMobile extends ViewModelWidget<BookingsViewModel> {
  const BookingsViewMobile({super.key});

  @override
  Widget build(BuildContext context, BookingsViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
