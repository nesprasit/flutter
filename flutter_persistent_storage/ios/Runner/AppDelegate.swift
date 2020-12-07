import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    let CHANNEL = "flutter.native/utils"
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // setUp
        if let viewController = window?.rootViewController as? FlutterViewController {
            let methodChannel = FlutterMethodChannel.init(name: CHANNEL, binaryMessenger: viewController.binaryMessenger)
            
            methodChannel.setMethodCallHandler {
                (call:FlutterMethodCall,result: @escaping FlutterResult) -> Void in
               
                if(!self.onMethodCallHandle(call: call, result: result)){
                    result(FlutterMethodNotImplemented)
                }
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func onMethodCallHandle(call:FlutterMethodCall,result:FlutterResult) -> Bool{
        switch call.method {
        case "getText":
            result(self.getText())
            return true
        default:
            return false
        }
    }
    
    func getText() -> String{
        return "I'm Native app ios"
    }
}
