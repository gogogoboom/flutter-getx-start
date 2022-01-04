import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../views/nav/contact/nav_contact_view.dart';
import '../../views/nav/live/nav_live_view.dart';
import '../../views/nav/message/nav_message_view.dart';
import '../../views/nav/mine/nav_mine_view.dart';
import 'index_logic.dart';

class IndexPage extends GetView<IndexLogic> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _indexView(context);

  List<Widget> _buildScreens() {
    return <Widget>[
      keepAliveWrapper(const NavMessagePage()),
      keepAliveWrapper(const NavContactPage()),
      keepAliveWrapper(const NavLivePage()),
      keepAliveWrapper(const NavMinePage()),
    ];
  }

  Widget _indexView(BuildContext context) => PersistentTabView(
        Get.context!,
        controller: controller.tabController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: context.theme.backgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        // navBarHeight: 48.h,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        // bottomScreenMargin: 48.h,
        onWillPop: (context) => controller.back(),
        selectedTabScreenContext: (context) {},
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property
      );

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: Get.theme.bottomAppBarColor,
        inactiveColorPrimary: Get.theme.unselectedWidgetColor,
        title: 'nav_home'.tr,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people),
        activeColorPrimary: Get.theme.bottomAppBarColor,
        inactiveColorPrimary: Get.theme.unselectedWidgetColor,
        title: 'nav_contact'.tr,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.play_arrow),
        activeColorPrimary: Get.theme.bottomAppBarColor,
        inactiveColorPrimary: Get.theme.unselectedWidgetColor,
        title: 'nav_live'.tr,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: Get.theme.bottomAppBarColor,
        inactiveColorPrimary: Get.theme.unselectedWidgetColor,
        title: 'nav_mine'.tr,
      ),
    ];
  }
}
