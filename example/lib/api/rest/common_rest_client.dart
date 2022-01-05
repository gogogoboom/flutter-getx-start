import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';
import 'package:gogoboom_flutter_getx_start_example/models/params/upgrade_params.dart';
import 'package:gogoboom_flutter_getx_start_example/models/upgrade_version.dart';

part 'common_rest_client.g.dart';

final CommonRestClient commonRestClient =
    CommonRestClient(dio, baseUrl: coreConfig.baseUrl);

@RestApi()
abstract class CommonRestClient {
  factory CommonRestClient(Dio dio, {String? baseUrl}) = _CommonRestClient;

  ///版本更新
  @POST('/appsys/versioncheck')
  Future<UpgradeVersion?> upgrade(@Body() UpgradeParams params);
}
