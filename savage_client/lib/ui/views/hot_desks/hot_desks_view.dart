import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
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
                    SizedBox(
                      width: 200,
                      child: BoardDateTimeInputField(
                        initialDate: viewModel.startDateTime,
                        // Set readonly to true to hide keyboard
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        options: BoardDateTimeOptions(
                            backgroundColor: Colors.white,
                            languages: const BoardPickerLanguages.en(),
                            pickerFormat: PickerFormat.dmy,
                            startDayOfWeek: DateTime.monday,
                            customOptions: BoardPickerCustomOptions(
                              minutes: [0, 30],
                            )),
                        showPickerType: BoardDateTimeFieldPickerType.mini,
                        onChanged: viewModel.changeStartDateTime,
                        controller: viewModel.startDateTimeTextController,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: BoardDateTimeInputField(
                        // Set readonly to true to hide keyboard
                        readOnly: true,
                        initialDate: viewModel.endDateTime,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        options: BoardDateTimeOptions(
                            backgroundColor: Colors.white,
                            languages: const BoardPickerLanguages.en(),
                            pickerFormat: PickerFormat.dmy,
                            startDayOfWeek: DateTime.monday,
                            customOptions: BoardPickerCustomOptions(
                              minutes: [0, 30],
                            )),
                        showPickerType: BoardDateTimeFieldPickerType.mini,
                        onChanged: viewModel.changeEndDateTime,
                        controller: viewModel.endDateTimeTextController,
                      ),
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
    await viewModel.fetchHotDesks();
    super.onViewModelReady(viewModel);
  }

  @override
  DesksViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DesksViewModel();
}
