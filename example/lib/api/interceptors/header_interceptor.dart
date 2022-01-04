import 'package:dio/dio.dart' as dio;
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import '../../global/global_controller.dart';
import '../../models/authorization.dart';

class HeaderInterceptor extends Interceptor {
  final GlobalController _globalLogic = Get.find<GlobalController>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType ??= dio.Headers.jsonContentType;
    final Authorization? authorization = _globalLogic.authorization;
    logger.d('HeaderInterceptor Token: ${authorization?.token}');
    if (authorization?.tokenType != null && authorization?.token != null) {
      options.headers.addAll(
        <String, dynamic>{'Authorization': '${authorization?.token}'},
      );
    }
    if (options.headers.containsKey('loading')) {
      toastLoading();
    }
    handler.next(options);
  }
}
