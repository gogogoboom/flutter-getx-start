import 'package:get/get.dart';
import '../../global/global_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'index_state.dart';

class IndexLogic extends GetxController {
  final IndexState state = IndexState();
  final _globalLogic = Get.find<GlobalController>();
  final PersistentTabController tabController = PersistentTabController();
  final RxBool isMember = false.obs;
  final RxInt currentIndex = 0.obs;

  @override
  Future onInit() async {
    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });
    super.onInit();
  }

  Future<bool> back() async {
    return true;
  }
}
