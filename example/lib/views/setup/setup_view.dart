import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogoboom_flutter_getx_start_example/component/base/base_appbar.dart';
import 'package:gogoboom_flutter_getx_start_example/component/base/base_scaffold.dart';

import 'setup_logic.dart';

class SetupPage extends GetView<SetupLogic> {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(title: 'setup'.tr),
      body: Column(
        children: [
          ListTile(
            title: Text('night_mode'.tr),
            trailing: Obx(() => CupertinoSwitch(
                value: controller.isNightMode,
                onChanged: (value) => controller.onNightMode(context, value))),
          ),
          ListTile(
            title: Text('translation'.tr),
            trailing: Obx(() => CupertinoSwitch(
                value: controller.isTranslation,
                onChanged: (value) => controller.onTranslation(context, value))),
          )
        ],
      ),
    );
  }
}
