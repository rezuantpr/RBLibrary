//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 28.03.2021.
//

import Foundation

public protocol RBStringConverting {
  var asString: String { get }
}

public extension RBStringConverting {
  var asString: String {
    String(describing: self)
  }
}

public protocol RBIntConverting {
  var asInt: Int { get }
}

public extension RBIntConverting where Self == Double {
  var asInt: Int {
    return Int(self)
  }
}

public protocol RBDoubleConverting {
  var asDouble: Double { get }
}

public extension RBDoubleConverting where Self: BinaryInteger {
  var asDouble: Double {
    return Double(self)
  }
}


extension Int: RBStringConverting, RBDoubleConverting { }
extension Double: RBStringConverting, RBIntConverting { }
