import UIKit

extension RBApp {
  
  enum Launch {
    
    static func run() {
      self.count += 1
      if (UserDefaults.standard.object(forKey: "RBDateFirstLaunch") as? Date) == nil {
        UserDefaults.standard.set(Date(), forKey: "RBDateFirstLaunch")
      }
      
    }
    
    static var count: Int {
      get { return UserDefaults.standard.value(forKey: "RBLaunchCount") as? Int ?? 0 }
      set { UserDefaults.standard.set(newValue, forKey: "RBLaunchCount") }
    }
    
    static var isFirstLaunch: Bool {
      return (self.count == 0)
    }
    
    static var dateFirstLaunch: Date {
      return ((UserDefaults.standard.object(forKey: "RBDateFirstLaunch") as? Date) ?? Date())
    }
    
    
    //
    static var notUpdated: Bool {
      return (UserDefaults.standard.object(forKey: "RBDateLastUpdateLaunch") as? Date) == nil
    }
    
    static var dateLastUpdate: Date {
      return ((UserDefaults.standard.object(forKey: "RBDateLastUpdateLaunch") as? Date) ?? Date())
    }
    
    static func update() {
      UserDefaults.standard.set(Date(), forKey: "RBDateLastUpdateLaunch")
    }
  }
}
