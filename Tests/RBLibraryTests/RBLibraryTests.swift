import XCTest
@testable import RBLibrary


final class RBLibraryTests: XCTestCase {
  
  
  func testExample() {
    XCTAssertEqual(1.asString, "1")
    XCTAssertEqual(1.asDouble, 1.0)
    XCTAssertEqual(1.0.asInt, 1)
    XCTAssertEqual(Optional("str").unwrap, "str")
  }
  
  static var allTests = [
    ("testExample", testExample),
  ]
}
