// The MIT License (MIT)
// Copyright © 2017 Ivan Varabei (varabeis@icloud.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public extension Int {
  
  static func random() -> Int {
    return Int.random(in: 0...Int.max)
  }
  
  static func random(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
  }
}

public extension Double {
  
  static func random() -> Double {
    return Double.random(in: 0...Double.greatestFiniteMagnitude)
  }
  
  static func random(min: Double, max: Double) -> Double {
    return Double.random(in: min...max)
  }
}

public extension Float {
  
  static func random() -> Float {
    return Float.random(in: 0...Float.greatestFiniteMagnitude)
  }
  
  static func random(min: Float, max: Float) -> Float {
    return Float.random(in: min...max)
  }
}

public extension CGFloat {
  
  static func random() -> CGFloat {
    return CGFloat.random(in: 0...CGFloat.greatestFiniteMagnitude)
  }
  
  static func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat.random(in: min...max)
  }
}

public extension Collection where Index == Int {
  
  func random() -> Iterator.Element? {
    return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
  }
}

public extension MutableCollection where Index == Int {
  
  mutating func shuffleInPlace() {
    
    if count < 2 { return }
    
    for i in startIndex ..< endIndex - 1 {
      let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
      guard i != j else { continue }
      self.swapAt(i, j)
    }
  }
}
