// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String EmptyValueKey = 'empty';
const String StartDateTimeValueKey = 'startDateTime';
const String EndDateTimeValueKey = 'endDateTime';

final Map<String, TextEditingController> _HotDesksViewTextEditingControllers =
    {};

final Map<String, FocusNode> _HotDesksViewFocusNodes = {};

final Map<String, String? Function(String?)?> _HotDesksViewTextValidations = {
  EmptyValueKey: null,
};

mixin $HotDesksView {
  TextEditingController get emptyController =>
      _getFormTextEditingController(EmptyValueKey);

  FocusNode get emptyFocusNode => _getFormFocusNode(EmptyValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_HotDesksViewTextEditingControllers.containsKey(key)) {
      return _HotDesksViewTextEditingControllers[key]!;
    }

    _HotDesksViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HotDesksViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HotDesksViewFocusNodes.containsKey(key)) {
      return _HotDesksViewFocusNodes[key]!;
    }
    _HotDesksViewFocusNodes[key] = FocusNode();
    return _HotDesksViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    emptyController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    emptyController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          EmptyValueKey: emptyController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _HotDesksViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HotDesksViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HotDesksViewTextEditingControllers.clear();
    _HotDesksViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get emptyValue => this.formValueMap[EmptyValueKey] as String?;
  DateTime? get startDateTimeValue =>
      this.formValueMap[StartDateTimeValueKey] as DateTime?;
  DateTime? get endDateTimeValue =>
      this.formValueMap[EndDateTimeValueKey] as DateTime?;

  set emptyValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmptyValueKey: value}),
    );

    if (_HotDesksViewTextEditingControllers.containsKey(EmptyValueKey)) {
      _HotDesksViewTextEditingControllers[EmptyValueKey]?.text = value ?? '';
    }
  }

  bool get hasEmpty =>
      this.formValueMap.containsKey(EmptyValueKey) &&
      (emptyValue?.isNotEmpty ?? false);
  bool get hasStartDateTime =>
      this.formValueMap.containsKey(StartDateTimeValueKey);
  bool get hasEndDateTime => this.formValueMap.containsKey(EndDateTimeValueKey);

  bool get hasEmptyValidationMessage =>
      this.fieldsValidationMessages[EmptyValueKey]?.isNotEmpty ?? false;
  bool get hasStartDateTimeValidationMessage =>
      this.fieldsValidationMessages[StartDateTimeValueKey]?.isNotEmpty ?? false;
  bool get hasEndDateTimeValidationMessage =>
      this.fieldsValidationMessages[EndDateTimeValueKey]?.isNotEmpty ?? false;

  String? get emptyValidationMessage =>
      this.fieldsValidationMessages[EmptyValueKey];
  String? get startDateTimeValidationMessage =>
      this.fieldsValidationMessages[StartDateTimeValueKey];
  String? get endDateTimeValidationMessage =>
      this.fieldsValidationMessages[EndDateTimeValueKey];
}

extension Methods on FormStateHelper {
  Future<void> selectStartDateTime({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null) {
      this.setData(
        this.formValueMap..addAll({StartDateTimeValueKey: selectedDate}),
      );
    }

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  Future<void> selectEndDateTime({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null) {
      this.setData(
        this.formValueMap..addAll({EndDateTimeValueKey: selectedDate}),
      );
    }

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  setEmptyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmptyValueKey] = validationMessage;
  setStartDateTimeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StartDateTimeValueKey] = validationMessage;
  setEndDateTimeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EndDateTimeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    emptyValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      EmptyValueKey: getValidationMessage(EmptyValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _HotDesksViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _HotDesksViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      EmptyValueKey: getValidationMessage(EmptyValueKey),
    });
