// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/cupertino_date_time_picker/cupertino_date_time_picker_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/member_card/member_card_dialog.dart';

enum DialogType {
  infoAlert,
  cupertinoDateTimePicker,
  memberCard,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.cupertinoDateTimePicker: (context, request, completer) =>
        CupertinoDateTimePickerDialog(request: request, completer: completer),
    DialogType.memberCard: (context, request, completer) =>
        MemberCardDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
