import UIKit
import Flutter
import FirebaseCore
import FBSDKCoreKit
import GoogleMaps
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyDlNJdlotYUUVPg8iAVMmBa16xIsOjhzUY")
      if FirebaseApp.app() == nil {
          FirebaseApp.configure()
      }
      
      if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
              options: authOptions,
              completionHandler: {_, _ in })
          } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
          }

          application.registerForRemoteNotifications()

          Messaging.messaging().token { token, error in
            if let error = error {
              print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
              print("FCM registration token:==> \(token)")

      //        self.fcmRegTokenMessage.text  = "Remote FCM registration token: \(token)"
            }
          }

      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            let handledFB = ApplicationDelegate.shared.application(app, open: url, options: options)
            return handledFB
        }
    
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
         print("Registered for Apple Remote Notifications")
         Messaging.messaging().apnsToken = deviceToken
         Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)

     }
}
