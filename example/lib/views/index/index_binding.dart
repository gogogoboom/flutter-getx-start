import 'package:get/get.dart';
import '../../views/nav/contact/nav_contact_logic.dart';
import '../../views/nav/live/nav_live_logic.dart';
import '../../views/nav/message/nav_message_logic.dart';
import '../../views/nav/mine/nav_mine_logic.dart';

import 'index_logic.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexLogic());
    Get.lazyPut(() => NavMessageLogic());
    Get.lazyPut(() => NavContactLogic());
    Get.lazyPut(() => NavLiveLogic());
    Get.lazyPut(() => NavMineLogic());
  }
}
