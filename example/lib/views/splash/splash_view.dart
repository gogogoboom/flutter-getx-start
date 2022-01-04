import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../../component/base/base_scaffold.dart';
import '../../mock/mock_data.dart';

import 'splash_logic.dart';

class SplashPage extends GetView<SplashLogic> {
  final SplashLogic logic = Get.put(SplashLogic());

  SplashPage({Key? key}) : super(key: key);

  final colorizeColors = const [
    Color(0xfffc7a7f),
    Color(0xffcc6d70),
    Color(0xffab8486),
    Color(0xffd7d4d4),
  ];

  final colorizeTextStyle = TextStyle(
    fontSize: 40.0,
    color: Get.theme.primaryColor,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            imageUrl: MockData.avatarUlr,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 32,
            right: 32,
            child: SafeArea(
              child: GFAvatar(
                backgroundColor: Colors.black45,
                size: 32,
                child: GFProgressBar(
                  percentage: 1,
                  radius: 48,
                  circleWidth: 3,
                  animation: true,
                  animationDuration: logic.second * 1000,
                  padding: EdgeInsets.zero,
                  type: GFProgressType.circular,
                  backgroundColor: Colors.black26,
                  progressBarColor: Get.theme.primaryColor,
                  child: GestureDetector(
                    onTap: () => logic.jumpToIndex(),
                    child: Text(
                      '跳过',
                      style: Get.textTheme.bodyText2
                          ?.copyWith(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
