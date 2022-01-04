import 'dart:async';

import 'package:get/get.dart';
import 'package:gogoboom_flutter_getx_start/base_controller.dart';
import '../../global/global_controller.dart';
import '../../routes/page_routes.dart';

class SplashLogic extends BaseController {
  final int second = 3;
  final GlobalController _globalLogic = Get.find<GlobalController>();

  Timer? _timer;

  int? machineVerified;

  @override
  Future<void> onReady() async {
    _timer = Timer.periodic(
      Duration(seconds: second),
      (Timer timer) => jumpToIndex(),
    );
    super.onReady();
  }

  void jumpToIndex() {
    _timer?.cancel();
    var userinfo = _globalLogic.userInfo;
    if (userinfo == null) {
      Get.offAndToNamed(PageRoutes.login);
    } else {
      Get.offAndToNamed(PageRoutes.index);
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
