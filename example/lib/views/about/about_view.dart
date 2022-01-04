import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../../component/base/base_appbar.dart';
import '../../component/base/base_scaffold.dart';

import 'about_logic.dart';

class AboutPage extends GetView<AboutLogic> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(
        title: 'about'.tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              Utils.getSvgPath('ic_nav_message'),
              width: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              '版本：0.0.1_Debug',
              style: Get.textTheme.headline4,
            ),
            const SizedBox(
              height: 24,
            ),
            _itemView(title: 'feedback'.tr, onTap: () => {}),
            _itemView(title: 'agreement'.tr, onTap: () => {}),
            _itemView(
                title: 'check_version'.tr,
                tip: 'latest_version'.tr,
                onTap: () => {}),
          ],
        ),
      ),
    );
  }

  Widget _itemView(
      {required String title, GestureTapCallback? onTap, String? tip}) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [if (tip != null) Text(tip), const Icon(Icons.chevron_right)],
      ),
    );
  }
}
