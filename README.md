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

A Dart library for converting different type of datatypes to desired datatype output.

## Usage

To use this package, add datatype_converter as a dependency in your `pubspec.yaml` file.

## Example

```dart
//to convert different datatypes to int
    var result = DataConverter('2.3', 'int');
    // result = 2;

    var result = DataConverter('2.6', 'int');
    // result = 3;

    var result = DataConverter(2.6, 'int');
    // result = 3;

//to convert different datatypes to double
    var result = DataConverter(2.6, 'double');
    // result = 2.6;

    var result = DataConverter(2, 'double');
    // result = 2.0;

    var result = DataConverter('2', 'double');
    // result = 2.0;

    var result = DataConverter('2.0', 'double');
    // result = 2.0;

//to convert different datatypes to bool
    var result = DataConverter(0, 'bool');
    // result = true;
    // result = false; if 1 was inserted

    var result = DataConverter('0', 'bool');
    // result = true;
    // result = false; if '1' was inserted
    
    var result = DataConverter('true', 'bool');
    // result = true; also if true in any form is inserted as 'TRUE' or 'True'
    // result = false; if 'false' was inserted

    var result = DataConverter('t', 'bool');
    // result = true; aslso if 'T' was inserted
    // result = false; if 'f' was inserted

```


## Additional information

if you want String you can pass data but nothing else

```dart
    var result = DataConverter('Food');
    // result = 'Food'; returns as it is in String
```

```dart
// for double with fixed decimal points we can also use
    var result = DataConverter(3.141592653589793238, 'double', 3);
    // result = 3.141;

// in case value is inserted null for certain datatypes
    var result = DataConverter(null, 'bool');
    // result = false;

    var result = DataConverter(null, 'int');
    // result = 0;

    var result = DataConverter(null, 'double');
    // result = 0.0;

    var result = DataConverter(null, 'list');
    // result = [];

    var result = DataConverter(null);
    // result = '';

```

Hope this package helps and save some of your time.