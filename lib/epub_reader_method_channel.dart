import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'epub_reader_platform_interface.dart';

/// An implementation of [EpubReaderPlatform] that uses method channels.
class MethodChannelEpubReader extends EpubReaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('epub_reader');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
