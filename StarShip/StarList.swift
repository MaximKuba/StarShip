//
//  StarList.swift
//  StarShip
//
//  Created by Maxim Kuba on 20.04.2021.
//

import Foundation

struct StarList: Codable {
  let count: Int
  let next: String?
  let previous: String?
  let results: [StarShip]
}
