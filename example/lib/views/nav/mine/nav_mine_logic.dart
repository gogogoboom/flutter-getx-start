import 'package:gogoboom_flutter_getx_start/base_controller.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import '../../../config/init.dart';
import '../../../global/global_controller.dart';
import '../../../models/user_info.dart';
import 'nav_mine_state.dart';

class NavMineLogic extends BaseController<UserInfo> {
  final NavMineState _state = NavMineState();
  final GlobalController _globalController = Get.find();

  @override
  Future<UserInfo> Function() get requestFunc =>
      () => memberRestClient.userinfo();

  @override
  void onReady() {
    onRefresh();
    super.onReady();
  }

  @override
  void onDataLoaded() {
    // _globalController.updateUserInfo(state!);
    super.onDataLoaded();
  }
}
