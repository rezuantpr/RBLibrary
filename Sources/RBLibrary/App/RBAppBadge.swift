import UIKit

public extension RBApp {
  
  struct Badge {

    static var number: Int {
      get {
        return UIApplication.shared.applicationIconBadgeNumber
      }
      set {
        UIApplication.shared.applicationIconBadgeNumber = newValue
      }
    }
    
    static func reset() {
      UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    private init() {}
  }
}


