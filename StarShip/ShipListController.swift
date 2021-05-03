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
    
    self.tableView.tableFooterView = UIView()
    super.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShipListCell")
    self.tableView.rowHeight = 100
    self.tableView.estimatedRowHeight = UITableView.automaticDimension
    
//    self.tableView.separatorStyle = .singleLine
    
    
    
    //self.navigationController?.navigationBar.isTranslucent = true;
    //self.navigationController?.navigationBar.backgroundColor = .orange
    
    //self.navigationController?.navigationBar.barTintColor = .black
    //self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
    self.navigationItem.title = "List of Ships"
   
    
    self.navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      
    self.navigationController?.navigationBar.barTintColor = .gray
    self.navigationController?.navigationBar.backgroundColor = .black
    self.navigationController?.navigationBar.tintColor = .yellow    
    self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow, .font: UIFont(name: "StarJediHollow", size: (UIFont.labelFontSize + UIFont.labelFontSize/3))!]
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow, .font: UIFont(name: "StarJediHollow", size: (UIFont.labelFontSize + UIFont.labelFontSize/3))!]
    self.view.backgroundColor = .black
    //self.navigationController?.navigationBar.setT
    
    
    //self.navigationController?.navigationBar.prefersLargeTitles = true
    
//    for family in UIFont.familyNames.sorted() {
//        let names = UIFont.fontNames(forFamilyName: family)
//        print("Family: \(family) Font names: \(names)")
//    }
    print(UIFont.labelFontSize)
    
    getData(link: "http://swapi.dev/api/starships")
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shipList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ShipListCell")!
    
    
    cell.backgroundColor = .black
    cell.textLabel?.numberOfLines = 0;
    cell.textLabel?.textColor = .yellow
    cell.textLabel?.font = UIFont(name: "StarJedi", size: UIFont.labelFontSize)
    cell.textLabel?.text = shipList[indexPath.row].name
    
    let image = UIImage(systemName: "chevron.right")
    let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
    accessory.image = image
    
    
    // set the color here
    accessory.tintColor = .yellow
    cell.accessoryView = accessory
    
    cell.selectionStyle = .none
    
    
//    let backgroundView = UIView()
//    backgroundView.backgroundColor = .yellow
//    cell.selectedBackgroundView = backgroundView
    
    //cell.layer.borderWidth = 1
    //cell.layer.borderColor = UIColor.white.cgColor
    return cell
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let controller = ShipDescriptionController()
     //controller.navigationTitle = shipList[indexPath.row].name
    controller.starShip = shipList[indexPath.row]
    //controller.label.text = shipList[indexPath.row].name
     self.showDetailViewController(UINavigationController(rootViewController: controller), sender: nil)
  }
  func getData(link: String) {
    AF.request(link).validate().responseJSON { [weak self] response in
      switch response.result {
      case .success:
        if let jsonData = response.data,
           let result = try? JSONDecoder().decode(StarList.self, from: jsonData){
          self?.shipList.append(contentsOf: result.results)
          if result.next != nil {
            self?.getData(link: result.next!)
          }
        
          self?.tableView.reloadData()
        }
      case .failure(let error):
        print(error.localizedDescription)
        // add alert
      }
    }
  }
}



