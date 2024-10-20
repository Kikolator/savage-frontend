// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String CompanyNameValueKey = 'companyName';
const String WebsiteValueKey = 'website';
const String DescriptionValueKey = 'description';
const String CompanyEmailValueKey = 'companyEmail';
const String CompanyPhoneValueKey = 'companyPhone';

final Map<String, TextEditingController>
    _CreateBusinessProfileViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateBusinessProfileViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateBusinessProfileViewTextValidations = {
  CompanyNameValueKey: null,
  WebsiteValueKey: null,
  DescriptionValueKey: null,
  CompanyEmailValueKey: null,
  CompanyPhoneValueKey: null,
};

mixin $CreateBusinessProfileView {
  TextEditingController get companyNameController =>
      _getFormTextEditingController(CompanyNameValueKey);
  TextEditingController get websiteController =>
      _getFormTextEditingController(WebsiteValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get companyEmailController =>
      _getFormTextEditingController(CompanyEmailValueKey);
  TextEditingController get companyPhoneController =>
      _getFormTextEditingController(CompanyPhoneValueKey);

  FocusNode get companyNameFocusNode => _getFormFocusNode(CompanyNameValueKey);
  FocusNode get websiteFocusNode => _getFormFocusNode(WebsiteValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get companyEmailFocusNode =>
      _getFormFocusNode(CompanyEmailValueKey);
  FocusNode get companyPhoneFocusNode =>
      _getFormFocusNode(CompanyPhoneValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateBusinessProfileViewTextEditingControllers.containsKey(key)) {
      return _CreateBusinessProfileViewTextEditingControllers[key]!;
    }

    _CreateBusinessProfileViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateBusinessProfileViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateBusinessProfileViewFocusNodes.containsKey(key)) {
      return _CreateBusinessProfileViewFocusNodes[key]!;
    }
    _CreateBusinessProfileViewFocusNodes[key] = FocusNode();
    return _CreateBusinessProfileViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    companyNameController.addListener(() => _updateFormData(model));
    websiteController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    companyEmailController.addListener(() => _updateFormData(model));
    companyPhoneController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    companyNameController.addListener(() => _updateFormData(model));
    websiteController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    companyEmailController.addListener(() => _updateFormData(model));
    companyPhoneController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CompanyNameValueKey: companyNameController.text,
          WebsiteValueKey: websiteController.text,
          DescriptionValueKey: descriptionController.text,
          CompanyEmailValueKey: companyEmailController.text,
          CompanyPhoneValueKey: companyPhoneController.text,
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

    for (var controller
        in _CreateBusinessProfileViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateBusinessProfileViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateBusinessProfileViewTextEditingControllers.clear();
    _CreateBusinessProfileViewFocusNodes.clear();
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

  String? get companyNameValue =>
      this.formValueMap[CompanyNameValueKey] as String?;
  String? get websiteValue => this.formValueMap[WebsiteValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get companyEmailValue =>
      this.formValueMap[CompanyEmailValueKey] as String?;
  String? get companyPhoneValue =>
      this.formValueMap[CompanyPhoneValueKey] as String?;

  set companyNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CompanyNameValueKey: value}),
    );

    if (_CreateBusinessProfileViewTextEditingControllers.containsKey(
        CompanyNameValueKey)) {
      _CreateBusinessProfileViewTextEditingControllers[CompanyNameValueKey]
          ?.text = value ?? '';
    }
  }

  set websiteValue(String? value) {
    this.setData(
      this.formValueMap..addAll({WebsiteValueKey: value}),
    );

    if (_CreateBusinessProfileViewTextEditingControllers.containsKey(
        WebsiteValueKey)) {
      _CreateBusinessProfileViewTextEditingControllers[WebsiteValueKey]?.text =
          value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionValueKey: value}),
    );

    if (_CreateBusinessProfileViewTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _CreateBusinessProfileViewTextEditingControllers[DescriptionValueKey]
          ?.text = value ?? '';
    }
  }

  set companyEmailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CompanyEmailValueKey: value}),
    );

    if (_CreateBusinessProfileViewTextEditingControllers.containsKey(
        CompanyEmailValueKey)) {
      _CreateBusinessProfileViewTextEditingControllers[CompanyEmailValueKey]
          ?.text = value ?? '';
    }
  }

  set companyPhoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CompanyPhoneValueKey: value}),
    );

    if (_CreateBusinessProfileViewTextEditingControllers.containsKey(
        CompanyPhoneValueKey)) {
      _CreateBusinessProfileViewTextEditingControllers[CompanyPhoneValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasCompanyName =>
      this.formValueMap.containsKey(CompanyNameValueKey) &&
      (companyNameValue?.isNotEmpty ?? false);
  bool get hasWebsite =>
      this.formValueMap.containsKey(WebsiteValueKey) &&
      (websiteValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);
  bool get hasCompanyEmail =>
      this.formValueMap.containsKey(CompanyEmailValueKey) &&
      (companyEmailValue?.isNotEmpty ?? false);
  bool get hasCompanyPhone =>
      this.formValueMap.containsKey(CompanyPhoneValueKey) &&
      (companyPhoneValue?.isNotEmpty ?? false);

  bool get hasCompanyNameValidationMessage =>
      this.fieldsValidationMessages[CompanyNameValueKey]?.isNotEmpty ?? false;
  bool get hasWebsiteValidationMessage =>
      this.fieldsValidationMessages[WebsiteValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasCompanyEmailValidationMessage =>
      this.fieldsValidationMessages[CompanyEmailValueKey]?.isNotEmpty ?? false;
  bool get hasCompanyPhoneValidationMessage =>
      this.fieldsValidationMessages[CompanyPhoneValueKey]?.isNotEmpty ?? false;

  String? get companyNameValidationMessage =>
      this.fieldsValidationMessages[CompanyNameValueKey];
  String? get websiteValidationMessage =>
      this.fieldsValidationMessages[WebsiteValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get companyEmailValidationMessage =>
      this.fieldsValidationMessages[CompanyEmailValueKey];
  String? get companyPhoneValidationMessage =>
      this.fieldsValidationMessages[CompanyPhoneValueKey];
}

extension Methods on FormStateHelper {
  setCompanyNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CompanyNameValueKey] = validationMessage;
  setWebsiteValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WebsiteValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setCompanyEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CompanyEmailValueKey] = validationMessage;
  setCompanyPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CompanyPhoneValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    companyNameValue = '';
    websiteValue = '';
    descriptionValue = '';
    companyEmailValue = '';
    companyPhoneValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CompanyNameValueKey: getValidationMessage(CompanyNameValueKey),
      WebsiteValueKey: getValidationMessage(WebsiteValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      CompanyEmailValueKey: getValidationMessage(CompanyEmailValueKey),
      CompanyPhoneValueKey: getValidationMessage(CompanyPhoneValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateBusinessProfileViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateBusinessProfileViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CompanyNameValueKey: getValidationMessage(CompanyNameValueKey),
      WebsiteValueKey: getValidationMessage(WebsiteValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      CompanyEmailValueKey: getValidationMessage(CompanyEmailValueKey),
      CompanyPhoneValueKey: getValidationMessage(CompanyPhoneValueKey),
    });
