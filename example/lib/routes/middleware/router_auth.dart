import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import '../../global/global_controller.dart';
import '../page_routes.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({@required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (!Get.find<GlobalController>().isLogin) {
      return const RouteSettings(name: PageRoutes.login);
    }
    return null;
  }
}
