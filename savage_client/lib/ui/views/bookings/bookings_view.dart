import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savage_client/data/desk_booking.dart';
import 'package:savage_client/data/enums/booking_type.dart';
import 'package:savage_client/data/meeting_room_booking.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';

import 'bookings_viewmodel.dart';

class BookingsView extends StackedView<BookingsViewModel> {
  const BookingsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    BookingsViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Loader();
    }
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
              ],
            ),
          ),
          if (viewModel.hasError) ...[
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(viewModel.modelError,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.red)),
            ),
            verticalSpaceSmall,
          ],
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
                        'My Bookings',
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
                      final startTime = DateFormat.yMMMEd()
                          .add_Hm()
                          .format(booking.startTime);
                      final endTime = DateFormat.Hm().format(booking.endTime);
                      // check if meeting or desk booking
                      switch (booking.type) {
                        case BookingType.desk:
                          booking as DeskBooking;
                          return ListTile(
                              leading: const Icon(Icons.desk),
                              title: Text('Desk number: ${booking.deskNumber}'),
                              subtitle: Text('$startTime - $endTime'),
                              trailing: viewModel.showUpcoming
                                  ? IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () => viewModel.cancelBooking(
                                        booking,
                                      ),
                                    )
                                  : null);
                        case BookingType.meetingRoom:
                          booking as MeetingRoomBooking;
                          return ListTile(
                              leading: const Icon(Icons.meeting_room_rounded),
                              title: Text('Meeting room: ${booking.roomName}'),
                              subtitle: Text('$startTime - $endTime'),
                              trailing: viewModel.showUpcoming
                                  ? IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () => viewModel.cancelBooking(
                                        booking,
                                      ),
                                    )
                                  : null);
                      }
                    },
                  )
                ],
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void onViewModelReady(BookingsViewModel viewModel) async {
    await viewModel.fetchBookings();
    super.onViewModelReady(viewModel);
  }

  @override
  BookingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookingsViewModel();
}
