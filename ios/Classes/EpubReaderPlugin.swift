import Flutter
import UIKit

public class EpubReaderPlugin: NSObject, FlutterPlugin {

  let epubReader = EpubReader()
  static var pageResult: FlutterResult? = nil
  static var pageChannel:FlutterEventChannel? = nil  
  var window: UIWindow!

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "epub_reader", binaryMessenger: registrar.messenger())
    let instance = EpubReaderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "read":
      setPageHandler()
      let arguments = call.arguments as![String:Any]
      let bookPath = arguments["bookPath"] as! String
      let unzipPath = arguments["unzipPath"] as! String

      self.open(epubPath: bookPath, unzipPath: unzipPath)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  fileprivate func open(epubPath: String, unzipPath: String) {
     if epubPath == "" {
      return
     }
      window = UIWindow.init(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        let viewController = UIApplication.shared.windows.first?.rootViewController ?? UIViewController()
        epubReader.openEpubReader(parentViewController: viewController, withEpubPath: epubPath, unzipPath: unzipPath, window: self.window)
  }

   private func setPageHandler(){
          EpubReaderPlugin.pageChannel?.setStreamHandler(self)

      }
      
      public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
          EpubReaderPlugin.pageResult = events
          return nil
      }

      public func onCancel(withArguments arguments: Any?) -> FlutterError? {
          return nil
      }
    
    public func pageWillLoad(_ page: FolioReaderPage) {
          
          print("page.pageNumber:"+String(page.pageNumber))

          if (EpubReaderPlugin.pageResult != nil){
              EpubReaderPlugin.pageResult!(String(page.pageNumber))
          }

      }
      
}
