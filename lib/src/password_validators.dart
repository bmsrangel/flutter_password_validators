import 'package:flutter/material.dart'
    show FormFieldValidator, TextEditingController;

class PasswordValidators {
  PasswordValidators._();

  static FormFieldValidator<String> specialCharacteresValidator(
    String message,
  ) {
    return (value) {
      final specialCharacteresRegex = RegExp(r'[!@#$]');
      if (value != null && specialCharacteresRegex.hasMatch(value)) {
        return null;
      } else {
        return message;
      }
    };
  }

  static FormFieldValidator<String> upperCaseCharacteresValidator(
    String message,
  ) {
    return (value) {
      final upperCaseCharacteresRegex = RegExp(r'[A-Z]');
      if (value != null && upperCaseCharacteresRegex.hasMatch(value)) {
        return null;
      } else {
        return message;
      }
    };
  }

  static FormFieldValidator<String> lowerCaseCharacteresValidator(
    String message,
  ) {
    return (value) {
      final lowerCaseCharacteresRegex = RegExp(r'[a-z]');
      if (value != null && lowerCaseCharacteresRegex.hasMatch(value)) {
        return null;
      } else {
        return message;
      }
    };
  }

  static FormFieldValidator<String> containsNumberValidator(
    String message,
  ) {
    return (value) {
      final containsNumberRegex = RegExp(r'[0-9]');
      if (value != null && containsNumberRegex.hasMatch(value)) {
        return null;
      } else {
        return message;
      }
    };
  }

  static FormFieldValidator<String> required(String message) {
    return (value) {
      if (value == null || value.isEmpty) {
        return message;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> minLength(int minLength, String message) {
    return (value) {
      if (value != null && value.length < minLength) {
        return message;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> multipleValidators(
    List<FormFieldValidator<String>> validators,
  ) {
    return (value) {
      for (var validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  static FormFieldValidator<String> comparePasswords(
    TextEditingController otherPasswordController,
    String message,
  ) {
    return (value) {
      if (value == null || value != otherPasswordController.text) {
        return message;
      } else {
        return null;
      }
    };
  }
}
