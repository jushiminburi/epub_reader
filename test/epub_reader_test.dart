import 'package:flutter_test/flutter_test.dart';
import 'package:epub_reader/epub_reader.dart';
import 'package:epub_reader/epub_reader_platform_interface.dart';
import 'package:epub_reader/epub_reader_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEpubReaderPlatform
    with MockPlatformInterfaceMixin
    implements EpubReaderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EpubReaderPlatform initialPlatform = EpubReaderPlatform.instance;

  test('$MethodChannelEpubReader is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEpubReader>());
  });

  test('getPlatformVersion', () async {
    EpubReader epubReaderPlugin = EpubReader();
    MockEpubReaderPlatform fakePlatform = MockEpubReaderPlatform();
    EpubReaderPlatform.instance = fakePlatform;

  });
}
