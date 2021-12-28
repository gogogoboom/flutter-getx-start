
library gogoboom_flutter_getx_start;
export 'package:gogoboom_flutter_common/gogoboom_flutter_common.dart';
export 'package:get/get.dart';

import 'dart:async';
import 'package:flutter/services.dart';

class GogoboomFlutterGetxStart {
  static const MethodChannel _channel = MethodChannel('gogoboom_flutter_getx_start');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
