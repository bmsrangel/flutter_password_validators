<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# PasswordValidators

This package contains standard password validatior and it makes the validation process extremely simple.

## Available validations methods:

- Upper case validation;
- Lower case validation;
- Special characteres validation;
- Contains number validation;
- Required validation;
- Minimum length validation.

Additionally this package is full compatible with the [Validatorless](https://pub.dev/packages/validatorless) package and it can be used with the `Validatorless.multiple()` method as well.

## Getting started

To use this package, simply add it your dependencies in `pubspeck.yaml` using its GitHub link:

```yaml
dependencies:
  password_validators:
    git:
      url: https://github.com/bmsrangel/flutter_password_validators
      ref: main
```

## Usage

To validate a field, just set the `validator` parameter with the method of your choice.

```dart
TextFormField(
    decoration: const InputDecoration(
        labelText: 'Password',
    ),
    obscureText: true,
    validator: PasswordValidators.required('This field is required'),
),
```

It's also possible to use use multiple validations simultaneously. Just use the `PasswordValidators.multipleValidators()` method:

```dart
TextFormField(
    decoration: const InputDecoration(
        labelText: 'Password',
    ),
    obscureText: true,
    validator: PasswordValidators.multipleValidators([
        PasswordValidators.required('This field is required'),
        PasswordValidators.minLength(
        6,
        'This field must contain at least 6 characteres',
        ),
    ]),
),
```

Please check the example folder for the full code.

## Additional information

Did you find an issue? Please don't hesitate on opening an issue in our GitHub repository!
