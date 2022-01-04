import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import '../api/interceptors/header_interceptor.dart';
import '../api/interceptors/response_interceptor.dart';

class ChatCoreConfig extends CoreConfig {
  @override
  String get devHost => 'http://124.71.186.27:5600';

  @override
  String get hostSuffix => '/baseapp';

  @override
  Profiles get profiles => Profiles.dev;

  @override
  Interceptors get interceptors => _handleInterceptors();

  Interceptors _handleInterceptors() {
    Interceptors interceptors = Interceptors();
    interceptors.add(HeaderInterceptor());
    interceptors.add(ResponseInterceptor());
    return interceptors;
  }
}
