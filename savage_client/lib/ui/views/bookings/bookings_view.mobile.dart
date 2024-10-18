import 'package:flutter/material.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'bookings_viewmodel.dart';

class BookingsViewMobile extends ViewModelWidget<BookingsViewModel> {
  const BookingsViewMobile({super.key});

  @override
  Widget build(BuildContext context, BookingsViewModel viewModel) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: viewModel.selectUpcoming,
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        color: !viewModel.showUpcoming ? Colors.grey : null,
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  TextButton(
                    onPressed: viewModel.selectPast,
                    child: Text(
                      'Past',
                      style: TextStyle(
                        color: viewModel.showUpcoming ? Colors.grey : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                Text('${viewModel.bookings.length} Results'),
                horizontalSpaceSmall,
                // Text(
                //   'Duration: ${viewModel.durationString}',
                //   style: TextStyle(color: Colors.grey),
                // ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bookings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                if (viewModel.bookings.isEmpty) ...[
                  verticalSpaceMedium,
                  const Icon(Icons.calendar_month_outlined),
                  verticalSpaceSmall,
                  const Center(
                    child: Text('No bookings found'),
                  ),
                  verticalSpaceMedium,
                ],
                if (viewModel.bookings.isNotEmpty) ...[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.bookings.length,
                    itemBuilder: (context, index) {
                      final booking = viewModel.bookings[index];
                      return ListTile(
                          title: Text(
                              '${booking.startDateTime.day}/${booking.startDateTime.month}/${booking.startDateTime.year} ${booking.startDateTime.hour}:${booking.startDateTime.minute} - ${booking.endDateTime.hour}:${booking.endDateTime.minute}'),
                          subtitle: Text(
                              'desk: ${booking.deskNumber} status: ${booking.status.name}'),
                          trailing: viewModel.showUpcoming
                              ? IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => viewModel.cancelBooking(
                                    viewModel.bookings[index],
                                  ),
                                )
                              : null);
                    },
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
