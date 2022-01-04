import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../../../component/base/base_appbar.dart';
import '../../../component/base/base_scaffold.dart';

import 'nav_contact_logic.dart';

class NavContactPage extends GetView<NavContactLogic> {
  const NavContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: baseAppbar(title: 'nav_contact'.tr),
    );
  }
}
