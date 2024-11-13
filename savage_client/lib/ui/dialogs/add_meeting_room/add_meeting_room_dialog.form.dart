// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String DescriptionValueKey = 'description';
const String CapacityValueKey = 'capacity';
const String ActiveValueKey = 'active';

final Map<String, String> ActiveValueToTitleMap = {
  'true': 'yes',
  'false': 'no',
};

final Map<String, TextEditingController>
    _AddMeetingRoomDialogTextEditingControllers = {};

final Map<String, FocusNode> _AddMeetingRoomDialogFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AddMeetingRoomDialogTextValidations = {
  NameValueKey: null,
  DescriptionValueKey: null,
  CapacityValueKey: null,
};

mixin $AddMeetingRoomDialog {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get capacityController =>
      _getFormTextEditingController(CapacityValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get capacityFocusNode => _getFormFocusNode(CapacityValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddMeetingRoomDialogTextEditingControllers.containsKey(key)) {
      return _AddMeetingRoomDialogTextEditingControllers[key]!;
    }

    _AddMeetingRoomDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddMeetingRoomDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddMeetingRoomDialogFocusNodes.containsKey(key)) {
      return _AddMeetingRoomDialogFocusNodes[key]!;
    }
    _AddMeetingRoomDialogFocusNodes[key] = FocusNode();
    return _AddMeetingRoomDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    capacityController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    capacityController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          DescriptionValueKey: descriptionController.text,
          CapacityValueKey: capacityController.text,
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

    for (var controller in _AddMeetingRoomDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddMeetingRoomDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _AddMeetingRoomDialogTextEditingControllers.clear();
    _AddMeetingRoomDialogFocusNodes.clear();
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

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get capacityValue => this.formValueMap[CapacityValueKey] as String?;
  String? get activeValue => this.formValueMap[ActiveValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_AddMeetingRoomDialogTextEditingControllers.containsKey(NameValueKey)) {
      _AddMeetingRoomDialogTextEditingControllers[NameValueKey]?.text =
          value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionValueKey: value}),
    );

    if (_AddMeetingRoomDialogTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _AddMeetingRoomDialogTextEditingControllers[DescriptionValueKey]?.text =
          value ?? '';
    }
  }

  set capacityValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CapacityValueKey: value}),
    );

    if (_AddMeetingRoomDialogTextEditingControllers.containsKey(
        CapacityValueKey)) {
      _AddMeetingRoomDialogTextEditingControllers[CapacityValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);
  bool get hasCapacity =>
      this.formValueMap.containsKey(CapacityValueKey) &&
      (capacityValue?.isNotEmpty ?? false);
  bool get hasActive => this.formValueMap.containsKey(ActiveValueKey);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasCapacityValidationMessage =>
      this.fieldsValidationMessages[CapacityValueKey]?.isNotEmpty ?? false;
  bool get hasActiveValidationMessage =>
      this.fieldsValidationMessages[ActiveValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get capacityValidationMessage =>
      this.fieldsValidationMessages[CapacityValueKey];
  String? get activeValidationMessage =>
      this.fieldsValidationMessages[ActiveValueKey];
}

extension Methods on FormStateHelper {
  void setActive(String active) {
    this.setData(
      this.formValueMap..addAll({ActiveValueKey: active}),
    );

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setCapacityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CapacityValueKey] = validationMessage;
  setActiveValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ActiveValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    descriptionValue = '';
    capacityValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      CapacityValueKey: getValidationMessage(CapacityValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddMeetingRoomDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddMeetingRoomDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      CapacityValueKey: getValidationMessage(CapacityValueKey),
    });
