class GlobalConstant {
  static bool isDebug = true;
  static const int pageSize = 20;

  //卡片阴影
  static const double cardElevation = 0;

  //头像常规大小
  static const double avatarNormalSize = 40;

  //头像适中
  static const double avatarMiddleSize = 32;

  //常规内边距
  static const double paddingNormal = 12;

  //封面高度
  static const double coverHeightSingle = 128;
  static const double coverHeightTwo = 118;
  static const double coverHeightThree = 108;

  //常规icon大小
  static const double iconNormalSize = 24;
  static const double iconSmallSize = 18;

  ///包名
  static const String appPackageName = 'com.porn.bsv';

  ///国际化本地key
  static const String localThemeLocaleKey =
      '${appPackageName}local_theme_locale_key';

  ///主题本地key
  static const String localThemeColorKey =
      '${appPackageName}local_theme_color_key';

  ///主题是否跟随系统,默认为true
  static const String localThemeFollowSystemKey =
      '${appPackageName}local_theme_follow_system_key';

  static const String storageAuthorization = 'storage_authorization';
  static const String storageUserinfo = 'storage_userinfo';
  static const String performance = 'performance';
  static const String searchHistory = 'searchHistory';
  static const String searchKey = 'searchKey';
  static const String qrCode = 'https://www.baidu.com';

  /// //////////////////////////////////////常量////////////////////////////////////// ///
  static const String apiToken = '4d65e2a5626103f92a71867d7b49fea0';
  static const String tokenKey = 'token';
  static const String userId = 'userId';
  static const String refreshTokenKey = 'refresh-token';
  static const String userNameKey = 'user-name';
  static const String pwKey = 'user-pw';
  static const String userBasicCode = 'user-basic-code';
  static const String userInfo = 'user-info';
  static const String languageSelect = 'language-select';

  static const String languageSelectName = 'language-select-name';
  static const String refreshLanguage = 'refreshLanguageApp';
  static const String themeColor = 'theme-color';
  static const String locale = 'locale';
  static const String iosConfigId = 'id88888888';

  static const int startPage = 1;

  static const String wechatAppId = 'wxxxxxxxxxxx';
  static const String wechatUniversalLink = 'https://xxx.xxx.com/'; // iOS 请配置
  static const String wechatAppSecret = 'your wechat appSecret';
  static const String wechatMiniAppId = 'your wechat miniAppId';
}
