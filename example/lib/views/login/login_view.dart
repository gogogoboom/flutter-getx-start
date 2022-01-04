import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../../component/base/base_appbar.dart';
import '../../component/base/base_scaffold.dart';
import '../../component/login_input_text.dart';
import '../../routes/page_routes.dart';

import 'login_logic.dart';

class LoginPage extends GetView<LoginLogic> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(
        title: 'login'.tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Icon(
                    Icons.home,
                    size: 100,
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Text(
                      'app_name'.tr,
                      style: Get.textTheme.headline4,
                    ),
                  ),
                  LoginInputText(
                    title: 'username'.tr,
                    hint: 'username_hint'.tr,
                    textEditingController: controller.nameTextController,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                  ),
                  LoginInputText(
                      title: 'password'.tr,
                      hint: 'password_hint'.tr,
                      textEditingController: controller.pwdTextController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () => controller.login(),
                    child: Text('login'.tr),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    child: Text('register'.tr),
                    onPressed: () => Get.toNamed(PageRoutes.register),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
