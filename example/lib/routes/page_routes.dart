import 'package:get/get.dart';

import '../views/index/index_binding.dart';
import '../views/index/index_view.dart';
import '../views/login/login_binding.dart';
import '../views/login/login_view.dart';
import '../views/register/register_binding.dart';
import '../views/register/register_view.dart';
import '../views/setup/setup_binding.dart';
import '../views/setup/setup_view.dart';
import '../views/splash/splash_view.dart';
import 'middleware/router_auth.dart';

class PageRoutes {
  static const String index = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String about = '/about';
  static const String setup = '/setup';

  static final List<GetPage> getRoutes = <GetPage>[
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(
        name: register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
      transition: Transition.fadeIn,
      name: index,
      page: () => const IndexPage(),
      binding: IndexBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: setup,
      page: () => const SetupPage(),
      binding: SetupBinding(),
    ),
  ];

  static GetMiddleware authMiddleware = RouteAuthMiddleware(priority: 1);
}
