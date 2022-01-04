import 'dart:ui';

import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../api/rest/client_rest_client.dart';
import '../api/rest/member_rest_client.dart';

final ClientRestClient clientRestClient =
    ClientRestClient(dio, baseUrl: coreConfig.baseUrl);

final MemberRestClient memberRestClient =
    MemberRestClient(dio, baseUrl: coreConfig.baseUrl);

///初始化
class Initializer {
  static register(
      {required CoreConfig coreConf, required CommonConfig commonConf}) {
    coreConfig = coreConf;
    commonConfig = commonConf;
    SystemUtil.simpleSystemUIOverlayStyle(Brightness.light);
  }

  static registerGet() {
    Get.config(
        enableLog: true,
        defaultPopGesture: true,
        defaultTransition: Transition.cupertino);
  }
}
