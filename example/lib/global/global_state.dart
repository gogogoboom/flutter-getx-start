import 'package:get/get.dart';
import '../models/authorization.dart';
import '../models/user_info.dart';

class GlobalState {
  Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);
  Rx<Authorization?> authorization = Rx<Authorization?>(null);
}
