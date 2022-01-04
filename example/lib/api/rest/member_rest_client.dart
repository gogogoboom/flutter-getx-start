import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import '../../models/authorization.dart';
import '../../models/params/login_params.dart';
import '../../models/params/register_params.dart';
import '../../models/user_info.dart';

part 'member_rest_client.g.dart';

@RestApi()
abstract class MemberRestClient {
  factory MemberRestClient(Dio dio, {String? baseUrl}) = _MemberRestClient;

  @POST('/account/register')
  @Headers(<String, dynamic>{'loading': 'true'})
  Future register(@Body() RegisterParams param);

  @POST('/account/login')
  @Headers(<String, dynamic>{'loading': 'true'})
  Future<Authorization> login(@Body() LoginParams param);

  @GET('/member/baseinfo')
  Future<UserInfo> userinfo();
}
