//
//  ViewController.swift
//  StarShip
//
//  Created by Maxim Kuba on 19.04.2021.
//

import UIKit
import Alamofire

class ShipListController: UITableViewController {

  var shipList: [StarShip] = []
  override func viewDidLoad() {
    self.tableView = UITableView(frame: .zero, style: .plain)
    super.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    self.navigationItem.title = "Master"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    getData()
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shipList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "id")!
    cell.textLabel?.text = shipList[indexPath.row].name
    return cell
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let controller = ShipDescriptionController()
     controller.navigationTitle = shipList[indexPath.row].name
     self.showDetailViewController(UINavigationController(rootViewController: controller), sender: nil)
  }
  func getData() {
    AF.request("http://swapi.dev/api/starships").validate().responseJSON { (response) in
      switch response.result {
      case .success:
        if let jsonData = response.data,
           let result = try? JSONDecoder().decode(StarList.self, from: jsonData){
          
          self.shipList = result.results
          self.tableView.reloadData()
          
        }
      default:
        return
        
        
        
        
      }
    }
  }
}


