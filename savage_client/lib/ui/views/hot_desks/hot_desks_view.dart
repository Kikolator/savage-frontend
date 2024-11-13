import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/hot_desk_card/hot_desk_card.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';
import 'hot_desks_viewmodel.dart';

class HotDesksView extends StackedView<DesksViewModel> {
  const HotDesksView({super.key});

  @override
  Widget builder(
    BuildContext context,
    DesksViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Loader();
    } else {
      return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (viewModel.isAdmin) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Admin functions:'),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: viewModel.addDesk,
                            child: const Text('Add Desk'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8.0,
              ),
              child: Text(
                'Book Hot Desk',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Date picker
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date:',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        TextButton.icon(
                            icon: const Icon(Icons.calendar_month),
                            label: Text(DateFormat.MMMEd()
                                .format(viewModel.startDateTime)),
                            onPressed: () => viewModel.selectNewDate(context)),
                      ],
                    ),
                    // Start time picker
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start time:',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              viewModel.selectNewStartTime(context),
                          child: Text(
                            DateFormat.jm().format(viewModel.startDateTime),
                          ),
                        ),
                      ],
                    ),
                    horizontalSpaceTiny,
                    // End time picker
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End time:',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        ElevatedButton(
                            onPressed: () =>
                                viewModel.selectNewEndTime(context),
                            child: Text(
                                DateFormat.jm().format(viewModel.endDateTime))),
                      ],
                    ),
                    // TODO add switch for map view
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text('${viewModel.hotDesks.length} Results'),
                  horizontalSpaceSmall,
                  Text(
                    'Duration: ${viewModel.durationString}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (viewModel.hasError) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(viewModel.modelError,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.red)),
              )
            ],
            if (viewModel.hotDesks.isEmpty) ...[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpaceLarge,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month_rounded,
                          color: Colors.grey, size: 75),
                    ],
                  ),
                  Text(
                    'No Hot Desks to show.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey.shade700),
                  ),
                  Text(
                    'Try refining the filters',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.hotDesks.length,
                  itemBuilder: (context, index) {
                    return HotDeskCard(
                      desk: viewModel.hotDesks[index],
                      onPressed: () =>
                          viewModel.bookDesk(viewModel.hotDesks[index]),
                    );
                  }),
            ),
          ],
        ),
      );
    }
  }

  @override
  void onViewModelReady(DesksViewModel viewModel) async {
    await viewModel.initialiseModel();
    super.onViewModelReady(viewModel);
  }

  @override
  DesksViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DesksViewModel();
}
