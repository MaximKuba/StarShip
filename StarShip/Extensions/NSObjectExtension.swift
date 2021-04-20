//
//  NSObjectExtension.swift
//  StarShip
//
//  Created by Maxim Kuba on 19.04.2021.
//

import Foundation

extension NSObject {
  
  class var nameOfClass: String {
    String(describing: self)
  }
  
}



