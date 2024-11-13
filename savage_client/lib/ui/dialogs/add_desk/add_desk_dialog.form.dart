// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NumberValueKey = 'number';
const String TypeValueKey = 'type';
const String WorkspaceValueKey = 'workspace';
const String AvailableValueKey = 'available';
const String AssignedToValueKey = 'assigned to';
const String AssignedUntilValueKey = 'assigned until';

final Map<String, String> TypeValueToTitleMap = {
  'flexible': 'flexible',
  'fixed': 'fixed',
};
final Map<String, String> WorkspaceValueToTitleMap = {
  '0001': 'Av. España',
};
final Map<String, String> AvailableValueToTitleMap = {
  'true': 'yes',
  'false': 'no',
};

final Map<String, TextEditingController> _AddDeskDialogTextEditingControllers =
    {};

final Map<String, FocusNode> _AddDeskDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _AddDeskDialogTextValidations = {
  NumberValueKey: null,
  AssignedToValueKey: null,
};

mixin $AddDeskDialog {
  TextEditingController get numberController =>
      _getFormTextEditingController(NumberValueKey);
  TextEditingController get assignedToController =>
      _getFormTextEditingController(AssignedToValueKey);

  FocusNode get numberFocusNode => _getFormFocusNode(NumberValueKey);
  FocusNode get assignedToFocusNode => _getFormFocusNode(AssignedToValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddDeskDialogTextEditingControllers.containsKey(key)) {
      return _AddDeskDialogTextEditingControllers[key]!;
    }

    _AddDeskDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddDeskDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddDeskDialogFocusNodes.containsKey(key)) {
      return _AddDeskDialogFocusNodes[key]!;
    }
    _AddDeskDialogFocusNodes[key] = FocusNode();
    return _AddDeskDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    numberController.addListener(() => _updateFormData(model));
    assignedToController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    numberController.addListener(() => _updateFormData(model));
    assignedToController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NumberValueKey: numberController.text,
          AssignedToValueKey: assignedToController.text,
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

    for (var controller in _AddDeskDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddDeskDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _AddDeskDialogTextEditingControllers.clear();
    _AddDeskDialogFocusNodes.clear();
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

  String? get numberValue => this.formValueMap[NumberValueKey] as String?;
  String? get typeValue => this.formValueMap[TypeValueKey] as String?;
  String? get workspaceValue => this.formValueMap[WorkspaceValueKey] as String?;
  String? get availableValue => this.formValueMap[AvailableValueKey] as String?;
  String? get assignedToValue =>
      this.formValueMap[AssignedToValueKey] as String?;
  DateTime? get assignedUntilValue =>
      this.formValueMap[AssignedUntilValueKey] as DateTime?;

  set numberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NumberValueKey: value}),
    );

    if (_AddDeskDialogTextEditingControllers.containsKey(NumberValueKey)) {
      _AddDeskDialogTextEditingControllers[NumberValueKey]?.text = value ?? '';
    }
  }

  set assignedToValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AssignedToValueKey: value}),
    );

    if (_AddDeskDialogTextEditingControllers.containsKey(AssignedToValueKey)) {
      _AddDeskDialogTextEditingControllers[AssignedToValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasNumber =>
      this.formValueMap.containsKey(NumberValueKey) &&
      (numberValue?.isNotEmpty ?? false);
  bool get hasType => this.formValueMap.containsKey(TypeValueKey);
  bool get hasWorkspace => this.formValueMap.containsKey(WorkspaceValueKey);
  bool get hasAvailable => this.formValueMap.containsKey(AvailableValueKey);
  bool get hasAssignedTo =>
      this.formValueMap.containsKey(AssignedToValueKey) &&
      (assignedToValue?.isNotEmpty ?? false);
  bool get hasAssignedUntil =>
      this.formValueMap.containsKey(AssignedUntilValueKey);

  bool get hasNumberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey]?.isNotEmpty ?? false;
  bool get hasTypeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey]?.isNotEmpty ?? false;
  bool get hasWorkspaceValidationMessage =>
      this.fieldsValidationMessages[WorkspaceValueKey]?.isNotEmpty ?? false;
  bool get hasAvailableValidationMessage =>
      this.fieldsValidationMessages[AvailableValueKey]?.isNotEmpty ?? false;
  bool get hasAssignedToValidationMessage =>
      this.fieldsValidationMessages[AssignedToValueKey]?.isNotEmpty ?? false;
  bool get hasAssignedUntilValidationMessage =>
      this.fieldsValidationMessages[AssignedUntilValueKey]?.isNotEmpty ?? false;

  String? get numberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey];
  String? get typeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey];
  String? get workspaceValidationMessage =>
      this.fieldsValidationMessages[WorkspaceValueKey];
  String? get availableValidationMessage =>
      this.fieldsValidationMessages[AvailableValueKey];
  String? get assignedToValidationMessage =>
      this.fieldsValidationMessages[AssignedToValueKey];
  String? get assignedUntilValidationMessage =>
      this.fieldsValidationMessages[AssignedUntilValueKey];
}

extension Methods on FormStateHelper {
  Future<void> selectAssignedUntil({
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
        this.formValueMap..addAll({AssignedUntilValueKey: selectedDate}),
      );
    }

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  void setType(String type) {
    this.setData(
      this.formValueMap..addAll({TypeValueKey: type}),
    );

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  void setWorkspace(String workspace) {
    this.setData(
      this.formValueMap..addAll({WorkspaceValueKey: workspace}),
    );

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  void setAvailable(String available) {
    this.setData(
      this.formValueMap..addAll({AvailableValueKey: available}),
    );

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  setNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NumberValueKey] = validationMessage;
  setTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TypeValueKey] = validationMessage;
  setWorkspaceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WorkspaceValueKey] = validationMessage;
  setAvailableValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AvailableValueKey] = validationMessage;
  setAssignedToValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AssignedToValueKey] = validationMessage;
  setAssignedUntilValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AssignedUntilValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    numberValue = '';
    assignedToValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NumberValueKey: getValidationMessage(NumberValueKey),
      AssignedToValueKey: getValidationMessage(AssignedToValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddDeskDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddDeskDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NumberValueKey: getValidationMessage(NumberValueKey),
      AssignedToValueKey: getValidationMessage(AssignedToValueKey),
    });
