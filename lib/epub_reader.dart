
import 'package:flutter/services.dart';


class EpubReader {
 static const MethodChannel _channel =  MethodChannel('epub_reader');

   void open(String bookPath, String unzipPath) async {
    Map<String, dynamic> agrs = {
      "bookPath": bookPath,
      "unzipPath": unzipPath
    };
    await _channel.invokeMethod('open', agrs);
  }

}
