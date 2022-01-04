import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../../../component/base/base_appbar.dart';
import '../../../component/base/base_scaffold.dart';

import 'nav_live_logic.dart';

class NavLivePage extends GetView<NavLiveLogic> {
  const NavLivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: baseAppbar(
        title: 'nav_live'.tr,
      ),
    );
  }
}
