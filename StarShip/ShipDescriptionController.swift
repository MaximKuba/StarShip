//
//  ShipDescriptionController.swift
//  StarShip
//
//  Created by Maxim Kuba on 19.04.2021.
//

import UIKit

class ShipDescriptionController: UITableViewController {
  
  var navigationTitle: String = "Ship description"
  //var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
  var starShip: StarShip?
  
  
  
  override func viewDidLoad() {
    
    self.tableView = UITableView(frame: .zero, style: .insetGrouped)
    self.tableView.tableFooterView = UIView()
    super.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShipDescriptionCell")
    
    //    if let splitController = self.splitViewController{
    //       if let navController = splitController.viewControllers.last as? UINavigationController {
    //          navController.topViewController?.navigationItem.leftBarButtonItem = splitController.displayModeButtonItem
    //        navController.topViewController?.navigationItem.leftBarButtonItem?.tintColor = .yellow
    //       }
    //    }
    
    //self.label.lineBreakMode = .byWordWrapping
    //    self.label.text = "Ola"
    //    self.label.textColor = .yellow
    //    self.label.textAlignment = .center
    //    self.label.backgroundColor = .clear
    //    self.label.font = UIFont(name: "StarJediHollow", size: (UIFont.labelFontSize + UIFont.labelFontSize/3))
    //    //self.label.numberOfLines = 0
    //    self.label.adjustsFontSizeToFitWidth = true
    //self.navigationItem.titleView = label;
    
    
    self.navigationItem.title = navigationTitle
    self.navigationController?.navigationBar.barTintColor = .gray
    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow, .font: UIFont(name: "StarJediHollow", size: (UIFont.labelFontSize + UIFont.labelFontSize/3))!]
    self.view.backgroundColor = .black
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow, .font: UIFont(name: "StarJediHollow", size: (UIFont.labelFontSize + UIFont.labelFontSize/3))!]
    self.view.backgroundColor = .black
  }
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 13
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var text = "Unknown"
    switch indexPath {
    case [0,0]:
      text = starShip?.name ?? "Unknown"
    case [1,0]:
      text = starShip?.model ?? "Unknown"
    case [2,0]:
      text = starShip?.manufacturer ?? "Unknown"
    case [3,0]:
      text = starShip?.costInCredits ?? "Unknown"
    case [4,0]:
      text = starShip?.length ?? "Unknown"
    case [5,0]:
      text = starShip?.maxAtmospheringSpeed ?? "Unknown"
    case [6,0]:
      text = starShip?.crew ?? "Unknown"
    case [7,0]:
      text = starShip?.passengers ?? "Unknown"
    case [8,0]:
      text = starShip?.cargoCapacity ?? "Unknown"
    case [9,0]:
      text = starShip?.consumables ?? "Unknown"
    case [10,0]:
      text = starShip?.hyperdriveRating ?? "Unknown"
    case [11,0]:
      text = starShip?.mglt ?? "Unknown"
    case [12,0]:
      text = starShip?.starShipClass ?? "Unknown"
      
      
    default:
      text = "unknown"
    }
    
    
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ShipDescriptionCell")!
    cell.backgroundColor = .gray
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.textColor = .yellow
    cell.textLabel?.font = UIFont(name: "StarJedi", size: UIFont.labelFontSize)
    cell.textLabel?.text = text
    cell.selectionStyle = .none
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
    
    let myLabel = UILabel()
    myLabel.frame = CGRect(x: 20, y: 8, width: 500, height: 21)
    myLabel.font = UIFont(name: "StarJediHollow", size: (UIFont.labelFontSize + UIFont.labelFontSize/3))
    myLabel.numberOfLines = 0
    myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
    myLabel.textColor = .white
    
    
    let headerView = UIView()
    headerView.addSubview(myLabel)
    
    return headerView
  }
  
  
  
  
}
