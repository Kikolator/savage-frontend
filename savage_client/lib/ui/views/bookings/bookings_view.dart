import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'bookings_view.desktop.dart';
import 'bookings_view.tablet.dart';
import 'bookings_view.mobile.dart';
import 'bookings_viewmodel.dart';

class BookingsView extends StackedView<BookingsViewModel> {
  const BookingsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    BookingsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const BookingsViewMobile(),
      tablet: (_) => const BookingsViewTablet(),
      desktop: (_) => const BookingsViewDesktop(),
    );
  }

  @override
  BookingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookingsViewModel();
}
