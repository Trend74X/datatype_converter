import 'dart:developer';
import 'package:flutter/foundation.dart';

// ignore: non_constant_identifier_names
DataConverter(dynamic data, [type, decimalCount]) {
  dynamic value;
  if(data == null) {
    if(type == 'bool') {
      value = false;
    } else if(type == 'int') {
      value = 0;
    } else if(type == 'double') {
      value = 0.0;
    } else if(type == 'list') {
      value == [];
    } else {
      value = '';
    }
  } else {
    if(type == 'int') {
      if(data is String){
        var res = int.tryParse(data);
        if(res != null) {
          value = res;
        } else {
          var res = double.tryParse(data);
          if(res != null) {
            int? doubleVal = res.round();
            value = doubleVal;
          } else {
            value = 'Invalid int';
            if (kDebugMode) {
              log('ERROR: => Invalid int value detected');
            }
          }
        }
      } else if(data is double) {
        value = data.round();
      } else {
        value = data;
      }
    } else if(type == 'double') {
      if(data is String) {
        double? dou = double.tryParse(data);
        if(dou != null) {
          String str = dou.toStringAsFixed(decimalCount ?? 2);
          double dou1 = double.parse(str);
          value = dou1;
        } else {
          value = 'Invalid double';
          if (kDebugMode) {
            log('ERROR: => Invalid double value detected');
          }
        }
      } else if(data is int) {
        value = data.toDouble();
      } else {
        value = data.toDouble();
      }
    } else if(type == 'bool') {
      if(data.toString() == '0' || data == 't') {
        value = true;
      } else if(data.toString() == '1' || data == 'f'){
        value = false;
      } else if(data is bool) {
        value = data;
      } else if(data is String) {
        String input = data.toLowerCase();
        if(input == 'true') {
          value = true;
        } else if(input == 'false') {
          value = false;
        } else {
          value = 'Invalid bool';
          if (kDebugMode) {
            log('ERROR: => Invalid bool value detected');
          }
        }
      } else {
        value = 'Invalid bool';
        if (kDebugMode) {
          log('ERROR: => Invalid bool value detected');
        }
      }
    } else if(type == 'list') {
      value = ['$data'];
    } else {
      value = data.toString();
    }
  }
  return value;
}