import XCTest
@testable import RBLibrary


class AA: NSObject {
  func observe() {
//    NotificationCenter.default.observe(observer: self, notificationName: "1") { (info) in
//      print(info)
//    }
    
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "111"), object: nil, queue: .main) { notification in
      guard let userInfo = notification.userInfo else { return }
      guard let aa = userInfo["1"] as? String else { return }
      print(aa)
    }
  }
  
  func post() {
    NotificationCenter.default.post(name:  NSNotification.Name(rawValue: "111"), object: nil, userInfo: ["1":"huy"])
  }
}

final class RBLibraryTests: XCTestCase {
  
  let aa = AA()
  
  func testExample() {
    aa.observe()
    aa.post()
  }
  
  static var allTests = [
    ("testExample", testExample),
  ]
}
