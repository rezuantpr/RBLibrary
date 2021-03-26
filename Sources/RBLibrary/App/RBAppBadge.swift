import UIKit

public extension RBApp {
  
  public struct Badge {

    public  static var number: Int {
      get {
        return UIApplication.shared.applicationIconBadgeNumber
      }
      set {
        UIApplication.shared.applicationIconBadgeNumber = newValue
      }
    }
    
    public static func reset() {
      UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    private init() {}
  }
}


