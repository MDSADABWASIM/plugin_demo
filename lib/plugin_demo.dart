import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

enum Toast { LENGTH_SHORT, LENGTH_LONG }

enum ToastType { DEFAULT, INFO, WARNING, ERROR, CONFUSING,SUCCESS }

class PluginDemo {
  static const MethodChannel _channel = const MethodChannel('plugin_demo');

  static Future<bool> cancel() async {
    bool res = await _channel.invokeMethod("cancel");
    return res;
  }
 static Future<bool> dialog() async {
    bool res = await _channel.invokeMethod("dialog");
    return res;
  }

 static Future<bool> infoDialog() async {
    bool res = await _channel.invokeMethod("infoDialog");
    return res;
  }

   static Future<bool> warningDialog() async {
    bool res = await _channel.invokeMethod("warningDialog");
    return res;
  }

   static Future<bool> errorDialog() async {
    bool res = await _channel.invokeMethod("errorDialog");
    return res;
  }
  

  static Future<bool> showToast({
    @required String msg,
    Toast toastLength,
    int timeInSecForIos = 1,
    double fontSize = 16.0,
    ToastType toastType,
  }) async {
    String toast = "Toast.LENGTH_SHORT";
    if (toastLength == Toast.LENGTH_LONG) {
      toast = "Toast.LENGTH_LONG";
    }

    String type = "ToastType.DEFAULT";
    if (toastType == ToastType.INFO) {
      type = "ToastType.INFO";
    } else if (toastType == ToastType.WARNING) {
      type = "ToastType.WARNING";
    } else if (toastType == ToastType.ERROR) {
      type = "ToastType.ERROR";
    } else if (toastType == ToastType.CONFUSING) {
      type = "ToastType.CONFUSING";
    }else if (toastType == ToastType.SUCCESS) {
      type = "ToastType.SUCCESS";
    }else {
      type = "ToastType.DEFAULT";
    }

    final Map<String, dynamic> params = <String, dynamic>{
      'msg': msg,
      'length': toast,
      'time': timeInSecForIos,
      'type': type,
      'bgcolor': null,
    };

    bool res = await _channel.invokeMethod('showToast', params);
    return res;
  }
}
