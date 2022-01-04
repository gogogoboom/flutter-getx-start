import 'package:get_storage/get_storage.dart';
import '../config/global_constant.dart';

class GlobalPref {
  static final GetStorage Function() _globalBox = () => GetStorage();

  final ReadWriteValue authorization =
      ReadWriteValue(
    GlobalConstant.storageAuthorization,
    null,
    _globalBox,
  );

  final ReadWriteValue userinfo = ReadWriteValue(
    GlobalConstant.storageUserinfo,
    null,
    _globalBox,
  );

  final ReadWriteValue<bool> performance =
      ReadWriteValue<bool>(GlobalConstant.performance, false, _globalBox);

  final ReadWriteValue<List<dynamic>> searchHistory =
      ReadWriteValue<List<dynamic>>(GlobalConstant.searchHistory, [], _globalBox);

  void clearSearch() => _globalBox().remove(GlobalConstant.searchHistory);

  Future<void> clear() => _globalBox().erase();
}
