import UIKit

public extension RBApp {
  
  public enum Launch {
    
    public static func run() {
      self.count += 1
      if (UserDefaults.standard.object(forKey: "RBDateFirstLaunch") as? Date) == nil {
        UserDefaults.standard.set(Date(), forKey: "RBDateFirstLaunch")
      }
      
    }
    
    public static var count: Int {
      get { return UserDefaults.standard.value(forKey: "RBLaunchCount") as? Int ?? 0 }
      set { UserDefaults.standard.set(newValue, forKey: "RBLaunchCount") }
    }
    
    public static var isFirstLaunch: Bool {
      return (self.count == 0)
    }
    
    public static var dateFirstLaunch: Date {
      return ((UserDefaults.standard.object(forKey: "RBDateFirstLaunch") as? Date) ?? Date())
    }
    
    
    //
    public static var notUpdated: Bool {
      return (UserDefaults.standard.object(forKey: "RBDateLastUpdateLaunch") as? Date) == nil
    }
    
    public static var dateLastUpdate: Date {
      return ((UserDefaults.standard.object(forKey: "RBDateLastUpdateLaunch") as? Date) ?? Date())
    }
    
    public static func update() {
      UserDefaults.standard.set(Date(), forKey: "RBDateLastUpdateLaunch")
    }
  }
}
