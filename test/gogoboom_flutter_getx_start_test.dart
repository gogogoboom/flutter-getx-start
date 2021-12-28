import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

void main() {
  const MethodChannel channel = MethodChannel('gogoboom_flutter_getx_start');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await GogoboomFlutterGetxStart.platformVersion, '42');
  });
}
