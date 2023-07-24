import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:epub_reader/epub_reader_method_channel.dart';

void main() {
  MethodChannelEpubReader platform = MethodChannelEpubReader();
  const MethodChannel channel = MethodChannel('epub_reader');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
