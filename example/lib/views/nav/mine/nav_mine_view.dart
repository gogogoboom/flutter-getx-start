import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import 'package:gogoboom_flutter_getx_start_example/routes/page_routes.dart';

import '../../../component/base/base_appbar.dart';
import '../../../component/base/base_scaffold.dart';
import 'nav_mine_logic.dart';

class NavMinePage extends GetView<NavMineLogic> {
  const NavMinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: baseAppbar(title: 'nav_mine'.tr,
          actions: [
        IconButton(
            onPressed: () => Get.toNamed(PageRoutes.setup),
            icon: const Icon(CupertinoIcons.settings))
      ]),
    );
  }
}
