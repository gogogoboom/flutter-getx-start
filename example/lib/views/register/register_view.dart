import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../../component/base/base_appbar.dart';
import '../../component/base/base_scaffold.dart';
import '../../component/login_input_text.dart';

import 'register_logic.dart';

class RegisterPage extends GetView<RegisterLogic> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(title: 'register'.tr),
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
                  const Divider(),
                  LoginInputText(
                    title: '验证码',
                    hint: '请输入验证码',
                    textEditingController: controller.codeTextController,
                    suffix: _sendCodeWidget(),
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                  ),
                  const Divider(),
                  LoginInputText(
                      title: 'password'.tr,
                      hint: 'password_hint'.tr,
                      textEditingController: controller.pwdTextController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true),
                  const Divider(),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    child: Text('register'.tr),
                    onPressed: () => controller.register(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _sendCodeWidget() => Obx(() => TextButton(
        child: Text(
          controller.sendBtnShow,
          style: Get.textTheme.bodyText2,
        ),
        onPressed:
            controller.canSend ? () => controller.sendVerifyCode() : null,
      ));
}
