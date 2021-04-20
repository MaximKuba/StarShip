//
//  Storyboards.swift
//  StarShip
//
//  Created by Maxim Kuba on 19.04.2021.
//

import UIKit

enum Storyboards: String {
  
  case main
  
  var storyboard: UIStoryboard {
    UIStoryboard(name: self.rawValue.capitalized,
                 bundle: .main)
  }
  
}
