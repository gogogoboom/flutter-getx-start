import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  final String? id;
  final String? loginName;
  final String? nickName;
  final String? avatar;
  final String? mailbox;
  final String? introduce;
  final int? gender;
  final String? rNumber;
  final String? regDate;
  final String? lastLoginDate;
  final String? frozenTime;
  final double? capital;
  final double? capitalLocking;
  final int? freeTimesPerDay;
  final double? loginLat;
  final double? loginLong;
  final int? allFreeTimesPerDay;
  final String? easePwd;

  UserInfo(
      {this.id,
      this.mailbox,
      this.introduce,
      this.loginName,
      this.nickName,
      this.avatar,
      this.gender,
      this.rNumber,
      this.regDate,
      this.lastLoginDate,
      this.frozenTime,
      this.capital,
      this.capitalLocking,
      this.freeTimesPerDay,
      this.allFreeTimesPerDay,
      this.loginLat,
      this.loginLong,
      this.easePwd});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  bool get login => false;

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  factory UserInfo.empty() => UserInfo(loginName: '', id: '');

  String get showName => nickName ?? loginName ?? id ?? '未登录';
}
