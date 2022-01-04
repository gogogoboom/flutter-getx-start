import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../../global/global_controller.dart';
import '../../routes/page_routes.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final GlobalController _globalController = Get.find();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController pwdTextController = TextEditingController();

  Future? login() async {
    String username = nameTextController.text.trim();
    String password = pwdTextController.text.trim();
    var machineCode = await _globalController.getMachineCode();
    //TODO 登录api调用
    // await imManager.imClientService.login(username, password);
    // Authorization authorization = await memberRestClient.login(LoginParams(
    //     loginName: username,
    //     meId: machineCode ?? '',
    //     passWord: password,
    //     areaCode: ''));
    // _globalController.authorization = authorization;
    // UserInfo userInfo = await memberRestClient.userinfo();
    // await _globalController.loginSuccess(authorization, userInfo);
    Get.offAllNamed(PageRoutes.index);
  }
}
