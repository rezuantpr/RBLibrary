
import UIKit

enum RBApp {
  
  static var udid: String? {
    return UIDevice.current.identifierForVendor?.uuidString
  }
  
  static var displayName: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
  }
  
  static var rootController: UIViewController? {
    return UIApplication.shared.keyWindow?.rootViewController
  }
  
  static func set(rootController: UIViewController, animatable: Bool = true) {
    rootController.view.frame = UIScreen.main.bounds
    
    let replaceRootViewController = {
      UIApplication.shared.keyWindow?.rootViewController = rootController
    }
    
    if animatable {
      UIView.transition(
        with: UIApplication.shared.keyWindow ?? UIWindow(),
        duration: 0.3,
        options: .transitionCrossDissolve,
        animations: {
          replaceRootViewController()
        }, completion: nil)
    } else {
      replaceRootViewController()
    }
  }  
}
