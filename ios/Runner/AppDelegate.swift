import UIKit
import Flutter
import FirebaseCore
import GoogleMaps
let googleApiKey = "AIzaSyB0Gt-v2NwnJhKUc6-6BNt67q3wwZIwSoM"

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GMSServices.provideAPIKey(googleApiKey)
        GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
