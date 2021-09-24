import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // override func applicationWillResignActive(_ application: UIApplication) {
  //   // Protected screen capture (Enabled)
  //   self.window.hidden = YES;
  // }
  
  // override func applicationDidBecomeActive(_ application: UIApplication) {
  //   // Protected screen capture (Disabled)
  //   self.window.hidden = NO;
  // }
}
