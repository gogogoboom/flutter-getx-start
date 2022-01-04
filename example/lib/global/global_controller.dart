import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import '../models/authorization.dart';
import '../models/user_info.dart';

import 'global_pref.dart';
import 'global_state.dart';

class GlobalController extends GetxController {
  final GlobalState _state = GlobalState();
  final GlobalPref _globalPref = Get.put<GlobalPref>(GlobalPref());
  ///首页下标
  final RxInt pageIndex = 0.obs;

  UserInfo? get userInfo => _state.userInfo.value;

  set userInfo(UserInfo? userinfo) => _state.userInfo.value = userinfo;

  Authorization? get authorization => _state.authorization.value;

  set authorization(Authorization? authorization) =>
      _state.authorization.value = authorization;

  bool get isLogin => _state.userInfo.value != null;

  Future<Void?> loginSuccess(
      Authorization? authorization, UserInfo userInfo) async {
    this.userInfo = userInfo;
    this.authorization = authorization ?? this.authorization;
    if (authorization != null) {
      _globalPref.authorization.val = authorization.toJson();
      logger.d('loginSuccess Authorization: ${authorization.toJson()}');
    }
    _globalPref.userinfo.val = userInfo.toJson();
    logger.d('loginSuccess UserInfo: ${userInfo.toJson()}');
  }

  Future<Void?> updateUserInfo(UserInfo userInfo) async {
    this.userInfo = userInfo;
    _globalPref.userinfo.val = userInfo.toJson();
    logger.d('updateUserInfo UserInfo: ${userInfo.toJson()}');
  }

  @override
  Future<Void?> onInit() async {
    await GetStorage.init();
    loadUserFromLocal();
    logger.d('GlobalController: 「onInit」');
    super.onInit();
  }

  ///本地读取登录的用户数据
  void loadUserFromLocal() {
    try {
      userInfo = UserInfo.fromJson(_globalPref.userinfo.val);
      authorization =
          Authorization.fromJson(_globalPref.authorization.val);
      logger.d('读取本地用户信息成功: ${userInfo?.toJson()} -${authorization?.toJson()}');
    } catch (e) {
      logger.e(e);
      logger.w('本地用户信息解析失败，已置为未登录状态');
    }
  }

  bool hasSetupPerformance() => _globalPref.performance.val;

  void setupPerformance() => _globalPref.performance.val = true;

  Future<String?> getMachineCode() => DeviceUtil.getMachineCode();

  Future? refreshUserInfo() async {
    //TODO 从后台获取用户信息
    UserInfo userInfo = UserInfo();
    updateUserInfo(userInfo);
  }

  Future<Uint8List?> capturePng(GlobalKey paintKey) async {
    try {
      final RenderRepaintBoundary? boundary =
      paintKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      final image = await boundary!.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
      await image.toByteData(format: ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  Future? logout() {
    //TODO 处理退出登录逻辑
  }
}
