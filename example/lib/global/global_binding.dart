

import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import 'global_controller.dart';

class GlobalBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(GlobalController());
  }
}