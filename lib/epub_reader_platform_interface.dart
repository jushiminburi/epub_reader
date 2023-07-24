import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'epub_reader_method_channel.dart';

abstract class EpubReaderPlatform extends PlatformInterface {
  /// Constructs a EpubReaderPlatform.
  EpubReaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static EpubReaderPlatform _instance = MethodChannelEpubReader();

  /// The default instance of [EpubReaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelEpubReader].
  static EpubReaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EpubReaderPlatform] when
  /// they register themselves.
  static set instance(EpubReaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
