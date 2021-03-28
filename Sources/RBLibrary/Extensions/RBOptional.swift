//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 28.03.2021.
//

import Foundation

public extension Optional where Wrapped == String {
  var unwrap: String {
    return self ?? ""
  }
}
