//
//  ShipDescriptionController.swift
//  StarShip
//
//  Created by Maxim Kuba on 19.04.2021.
//

import UIKit

class ShipDescriptionController: UITableViewController {
  
  var navigationTitle: String = "Ship description"
  var starShip: StarShip?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupTableView()
    view.backgroundColor = .black
    
  }
  
  func setupNavigationBar() {
    navigationItem.title = navigationTitle
    navigationController?.navigationBar.barTintColor = .gray
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow,
                                                                    .font: UIFont(name: "StarJediHollow",
                                                                                  size: 16.0) ?? .systemFont(ofSize: 16.0)]
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow,
                                                               .font: UIFont(name: "StarJediHollow",
                                                                             size: 16.0) ?? .systemFont(ofSize: 16.0)]
  }
  
  func setupTableView() {
    self.tableView = UITableView(frame: .zero, style: .insetGrouped)
    self.tableView.tableFooterView = UIView()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShipDescriptionCell")
    
  }
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 13
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var text = "Unknown"
    switch indexPath.row {
    case 0:
      text = starShip?.name ?? "Unknown"
    case 1:
      text = starShip?.model ?? "Unknown"
    case 2:
      text = starShip?.manufacturer ?? "Unknown"
    case 3:
      text = starShip?.costInCredits ?? "Unknown"
    case 4:
      text = starShip?.length ?? "Unknown"
    case 5:
      text = starShip?.maxAtmospheringSpeed ?? "Unknown"
    case 6:
      text = starShip?.crew ?? "Unknown"
    case 7:
      text = starShip?.passengers ?? "Unknown"
    case 8:
      text = starShip?.cargoCapacity ?? "Unknown"
    case 9:
      text = starShip?.consumables ?? "Unknown"
    case 10:
      text = starShip?.hyperdriveRating ?? "Unknown"
    case 11:
      text = starShip?.mglt ?? "Unknown"
    case 12:
      text = starShip?.starShipClass ?? "Unknown"
    default:
      text = "Unknown"
    }
    
    var cell = tableView.dequeueReusableCell(withIdentifier: "ShipDescriptionCell")!
    setupCell(cell: &cell, text: text)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection
                            section: Int) -> String? {
    switch section {
    case 0:
      return "Name"
    case 1:
      return "Model"
    case 2:
      return "Manufacturer"
    case 3:
      return "Cost In Credits"
    case 4:
      return "Length"
    case 5:
      return "Max Atmosphering Speed"
    case 6:
      return "crew"
    case 7:
      return "passengers"
    case 8:
      return "Cargo Capacity"
    case 9:
      return "Consumables"
    case 10:
      return "Hyper drive Rating"
    case 11:
      return "mglt"
    case 12:
      return "Star Ship Class"
    default:
      return "Unknown"
    }
    
  }
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return setupHeader(section: section)
  }
  
  func setupCell(cell: inout UITableViewCell, text: String) {
    cell.backgroundColor = .darkGray
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.textColor = .yellow
    cell.textLabel?.font = UIFont(name: "StarJedi", size: 16.0)
    cell.textLabel?.text = text
    cell.selectionStyle = .none
    
  }
  
  func setupHeader(section: Int) -> UIView? {
    let sectionLabel = UILabel()
    sectionLabel.frame = CGRect(x: 20, y: 8, width: view.bounds.width, height: 21)
    sectionLabel.font = UIFont(name: "StarJediHollow", size: (20.0))
    sectionLabel.numberOfLines = 0
    sectionLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
    sectionLabel.textColor = .white
    
    
    let headerView = UIView()
    headerView.addSubview(sectionLabel)
    
    return headerView
    
  }
  
  
  
  
}
