// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_validators.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String ContactEmailValueKey = 'contactEmail';
const String ContactPhoneValueKey = 'contactPhone';
const String PhoneWhatsappValueKey = 'phoneWhatsapp';

final Map<String, TextEditingController>
    _AddUserDataViewTextEditingControllers = {};

final Map<String, FocusNode> _AddUserDataViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddUserDataViewTextValidations =
    {
  FirstNameValueKey: AddUserDataValidators.validateFirstName,
  LastNameValueKey: AddUserDataValidators.validateLastName,
  ContactEmailValueKey: AddUserDataValidators.validateContactEmail,
  ContactPhoneValueKey: AddUserDataValidators.validateContactPhone,
  PhoneWhatsappValueKey: AddUserDataValidators.validatePhoneWhatsapp,
};

mixin $AddUserDataView {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get contactEmailController =>
      _getFormTextEditingController(ContactEmailValueKey);
  TextEditingController get contactPhoneController =>
      _getFormTextEditingController(ContactPhoneValueKey);
  TextEditingController get phoneWhatsappController =>
      _getFormTextEditingController(PhoneWhatsappValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get contactEmailFocusNode =>
      _getFormFocusNode(ContactEmailValueKey);
  FocusNode get contactPhoneFocusNode =>
      _getFormFocusNode(ContactPhoneValueKey);
  FocusNode get phoneWhatsappFocusNode =>
      _getFormFocusNode(PhoneWhatsappValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddUserDataViewTextEditingControllers.containsKey(key)) {
      return _AddUserDataViewTextEditingControllers[key]!;
    }

    _AddUserDataViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddUserDataViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddUserDataViewFocusNodes.containsKey(key)) {
      return _AddUserDataViewFocusNodes[key]!;
    }
    _AddUserDataViewFocusNodes[key] = FocusNode();
    return _AddUserDataViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    contactEmailController.addListener(() => _updateFormData(model));
    contactPhoneController.addListener(() => _updateFormData(model));
    phoneWhatsappController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    contactEmailController.addListener(() => _updateFormData(model));
    contactPhoneController.addListener(() => _updateFormData(model));
    phoneWhatsappController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          ContactEmailValueKey: contactEmailController.text,
          ContactPhoneValueKey: contactPhoneController.text,
          PhoneWhatsappValueKey: phoneWhatsappController.text,
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

    for (var controller in _AddUserDataViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddUserDataViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddUserDataViewTextEditingControllers.clear();
    _AddUserDataViewFocusNodes.clear();
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

  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get contactEmailValue =>
      this.formValueMap[ContactEmailValueKey] as String?;
  String? get contactPhoneValue =>
      this.formValueMap[ContactPhoneValueKey] as String?;
  String? get phoneWhatsappValue =>
      this.formValueMap[PhoneWhatsappValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_AddUserDataViewTextEditingControllers.containsKey(FirstNameValueKey)) {
      _AddUserDataViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_AddUserDataViewTextEditingControllers.containsKey(LastNameValueKey)) {
      _AddUserDataViewTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set contactEmailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ContactEmailValueKey: value}),
    );

    if (_AddUserDataViewTextEditingControllers.containsKey(
        ContactEmailValueKey)) {
      _AddUserDataViewTextEditingControllers[ContactEmailValueKey]?.text =
          value ?? '';
    }
  }

  set contactPhoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ContactPhoneValueKey: value}),
    );

    if (_AddUserDataViewTextEditingControllers.containsKey(
        ContactPhoneValueKey)) {
      _AddUserDataViewTextEditingControllers[ContactPhoneValueKey]?.text =
          value ?? '';
    }
  }

  set phoneWhatsappValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneWhatsappValueKey: value}),
    );

    if (_AddUserDataViewTextEditingControllers.containsKey(
        PhoneWhatsappValueKey)) {
      _AddUserDataViewTextEditingControllers[PhoneWhatsappValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasContactEmail =>
      this.formValueMap.containsKey(ContactEmailValueKey) &&
      (contactEmailValue?.isNotEmpty ?? false);
  bool get hasContactPhone =>
      this.formValueMap.containsKey(ContactPhoneValueKey) &&
      (contactPhoneValue?.isNotEmpty ?? false);
  bool get hasPhoneWhatsapp =>
      this.formValueMap.containsKey(PhoneWhatsappValueKey) &&
      (phoneWhatsappValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasContactEmailValidationMessage =>
      this.fieldsValidationMessages[ContactEmailValueKey]?.isNotEmpty ?? false;
  bool get hasContactPhoneValidationMessage =>
      this.fieldsValidationMessages[ContactPhoneValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneWhatsappValidationMessage =>
      this.fieldsValidationMessages[PhoneWhatsappValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get contactEmailValidationMessage =>
      this.fieldsValidationMessages[ContactEmailValueKey];
  String? get contactPhoneValidationMessage =>
      this.fieldsValidationMessages[ContactPhoneValueKey];
  String? get phoneWhatsappValidationMessage =>
      this.fieldsValidationMessages[PhoneWhatsappValueKey];
}

extension Methods on FormStateHelper {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setContactEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ContactEmailValueKey] = validationMessage;
  setContactPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ContactPhoneValueKey] = validationMessage;
  setPhoneWhatsappValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneWhatsappValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    contactEmailValue = '';
    contactPhoneValue = '';
    phoneWhatsappValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      ContactEmailValueKey: getValidationMessage(ContactEmailValueKey),
      ContactPhoneValueKey: getValidationMessage(ContactPhoneValueKey),
      PhoneWhatsappValueKey: getValidationMessage(PhoneWhatsappValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddUserDataViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddUserDataViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      ContactEmailValueKey: getValidationMessage(ContactEmailValueKey),
      ContactPhoneValueKey: getValidationMessage(ContactPhoneValueKey),
      PhoneWhatsappValueKey: getValidationMessage(PhoneWhatsappValueKey),
    });
