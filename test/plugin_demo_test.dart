import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  const MethodChannel channel = MethodChannel('plugin_demo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await PluginDemo.platformVersion, '42');
  // });
}
