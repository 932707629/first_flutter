
import 'package:flutter/services.dart';

class ALog {

  static const perform = const MethodChannel("android_log");

  static void v(List<String> obs) {
  perform.invokeMethod('logV', obs);
  }

  static void d(List<String> obs) {
  perform.invokeMethod('logD', obs);
  }

  static void i(List<String> obs) {
  perform.invokeMethod('logI', obs);
  }

  static void w(List<String> obs) {
  perform.invokeMethod('logW', obs);
  }

  static void e(List<String> obs) {
  perform.invokeMethod('logE',obs);
  }

}