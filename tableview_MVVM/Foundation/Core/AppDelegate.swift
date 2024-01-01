
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  //  var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Thread.sleep(forTimeInterval: 0.3)
      /*
        let gifStoryboard: UIStoryboard = UIStoryboard(name: "GIFViewControllerStoryboard", bundle: nil)
        let gifController: UIViewController = gifStoryboard.instantiateViewController(withIdentifier: "GifDisplay")

                window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = gifController
                window?.makeKeyAndVisible()
*/
        
        return true
    }
    

}

