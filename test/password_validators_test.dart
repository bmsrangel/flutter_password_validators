import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validators/password_validators.dart';

void main() {
  group(
    'Special characteres tests',
    () {
      const expectedError = 'At least one special character is required';
      final validator =
          PasswordValidators.specialCharacteresValidator(expectedError);

      test(
        'Should return error message if input does not contain at least one the characteres: !, @, # or \$',
        () {
          final error = validator('abc');
          expect(error, expectedError);
        },
      );
      test(
        'Should return null if input contains a special charactere',
        () {
          final result = validator('abc!');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Contains number tests',
    () {
      const expectedError = 'At least one number is required';
      final validator =
          PasswordValidators.containsNumberValidator(expectedError);
      test(
        'Should return error message if input does not contain at least one number',
        () {
          final error = validator('abc');
          expect(error, expectedError);
        },
      );
      test(
        'Should return null if input contains at least one number',
        () {
          final result = validator('abc1');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Upper case characteres tests',
    () {
      const expectedError = 'At least one upper case character is required';
      final validator =
          PasswordValidators.upperCaseCharacteresValidator(expectedError);

      test(
        'Should return an error message if input does not contain at least one upper case character',
        () {
          final error = validator('abc');
          expect(error, expectedError);
        },
      );
      test(
        'Should return null if input contains at least one upper case character',
        () {
          final result = validator('Abc');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Lower case characteres tests',
    () {
      const expectedError = 'At least one lower case character is required';
      final validator =
          PasswordValidators.lowerCaseCharacteresValidator(expectedError);

      test(
        'Should return an error message if input does not contain at least one lower case character',
        () {
          final error = validator('ABC');
          expect(error, expectedError);
        },
      );
      test(
        'Should return null if input contains at least one lower case character',
        () {
          final result = validator('Abc');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Contains number tests',
    () {
      const expectedError = 'At least one number is required';
      final validator =
          PasswordValidators.containsNumberValidator(expectedError);

      test(
        'Should return an error message if input does not contain at least one number',
        () {
          final error = validator('abc');
          expect(error, expectedError);
        },
      );
      test(
        'Should return null if input contains at least one number',
        () {
          final result = validator('Abc1');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Required field tests',
    () {
      const expectedError = 'This field is mandatory';
      final validator = PasswordValidators.required(expectedError);

      test(
        'Should return an error message if input is empty',
        () {
          final error = validator('');
          expect(error, expectedError);
        },
      );

      test(
        'Should return null if input is not empty',
        () {
          final result = validator('abc');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Minimum length tests',
    () {
      const expectedError = 'This field required a minimum of 6 characteres';
      final validator = PasswordValidators.minLength(6, expectedError);

      test(
        'Should return an error message if input is empty',
        () {
          final error = validator('');
          expect(error, expectedError);
        },
      );

      test(
        'Should return an error message if input contains less than 6 characteres',
        () {
          final error = validator('abcde');
          expect(error, expectedError);
        },
      );

      test(
        'Should return null if input is contains 6 characteres or more',
        () {
          final result = validator('abcdef');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Multiple validators test',
    () {
      const expectedErrorRequired = 'This field is mandatory';
      const expectedErrorContainsNumber = 'At least one number is required';
      final validator = PasswordValidators.multipleValidators(
        [
          PasswordValidators.required(expectedErrorRequired),
          PasswordValidators.containsNumberValidator(
            expectedErrorContainsNumber,
          ),
        ],
      );

      test(
        'Should return an error message if input is empty or null',
        () {
          var error = validator('');
          expect(error, expectedErrorRequired);
          error = validator(null);
          expect(error, expectedErrorRequired);
        },
      );

      test(
        'Should return an error message if input does not contain at least one number',
        () {
          final error = validator('abcde');
          expect(error, expectedErrorContainsNumber);
        },
      );

      test(
        'Should return null if input is not empty and contains at least one number',
        () {
          final result = validator('abc1');
          expect(result, null);
        },
      );
    },
  );

  group(
    'Password comparison tests',
    () {
      const expectedError = 'Passwords don\'t match';
      final otherPasswordController = TextEditingController(text: 'Abc12!');
      final validator = PasswordValidators.comparePasswords(
        otherPasswordController,
        expectedError,
      );

      test(
        'Should return error message if input does not match',
        () {
          var error = validator('');
          expect(error, expectedError);
          error = validator(null);
          expect(error, expectedError);
          error = validator('abc');
          expect(error, expectedError);
          error = validator('Abc12');
          expect(error, expectedError);
        },
      );
      test(
        'Should return null if input contains the exact same content',
        () {
          final result = validator('Abc12!');
          expect(result, null);
        },
      );
    },
  );
}
