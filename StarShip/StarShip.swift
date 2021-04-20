//
//  ShipModel.swift
//  StarShip
//
//  Created by Maxim Kuba on 20.04.2021.
//

import Foundation


struct StarShip: Codable, Hashable {
  let name: String
  let model: String
  let manufacturer: String
  let costInCredits: String //
  let length: String
  let maxAtmospheringSpeed: String //
  let crew: String
  let passengers: String
  let cargoCapacity: String  //
  let consumables: String
  let hyperdriveRating: String //
  let mglt: String //
  let starshipClass: String //

  enum StarShipKeys: String, CodingKey {
    
    case name, model, manufacturer, length, crew, passengers, consumables
    case costInCredits = "cost_in_credits"
    case maxAtmospheringSpeed = "max_atmosphering_speed"
    case cargoCapacity = "cargo_capacity"
    case hyperdriveRating =  "hyperdrive_rating"
    case mglt = "MGLT"
    case starshipClass = "starship_class"
  }


  init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: StarShipKeys.self)
    
    name = try container.decode(String.self, forKey: .name)
    model = try container.decode(String.self, forKey: .model)
    manufacturer = try container.decode(String.self, forKey: .manufacturer)
    costInCredits = try container.decode(String.self, forKey: .costInCredits)
    length = try container.decode(String.self, forKey: .length)
    maxAtmospheringSpeed = try container.decode(String.self, forKey: .maxAtmospheringSpeed)
    crew = try container.decode(String.self, forKey: .crew)
    passengers = try container.decode(String.self, forKey: .passengers)
    cargoCapacity = try container.decode(String.self, forKey: .cargoCapacity)
    consumables = try container.decode(String.self, forKey: .consumables)
    hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
    mglt = try container.decode(String.self, forKey: .mglt)
    starshipClass = try container.decode(String.self, forKey: .starshipClass)
  }
  
  func encode(to encoder: Encoder) throws {
    
    var container = encoder.container(keyedBy: StarShipKeys.self)
    
    try container.encode(StarShipKeys.name.rawValue, forKey: .name)
    try container.encode(StarShipKeys.model.rawValue, forKey: .model)
    try container.encode(StarShipKeys.manufacturer.rawValue, forKey: .manufacturer)
    try container.encode(StarShipKeys.costInCredits.rawValue, forKey: .costInCredits)
    try container.encode(StarShipKeys.length.rawValue, forKey: .length)
    try container.encode(StarShipKeys.maxAtmospheringSpeed.rawValue, forKey: .maxAtmospheringSpeed)
    try container.encode(StarShipKeys.crew.rawValue, forKey: .crew)
    try container.encode(StarShipKeys.passengers.rawValue, forKey: .passengers)
    try container.encode(StarShipKeys.cargoCapacity.rawValue, forKey: .cargoCapacity)
    try container.encode(StarShipKeys.consumables.rawValue, forKey: .consumables)
    try container.encode(StarShipKeys.hyperdriveRating.rawValue, forKey: .hyperdriveRating)
    try container.encode(StarShipKeys.mglt.rawValue, forKey: .mglt)
    try container.encode(StarShipKeys.starshipClass.rawValue, forKey: .starshipClass)
    
  }
}
