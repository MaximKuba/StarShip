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
    super.viewDidLoad()
    setupNavigationBar()
    setupTableView()
    view.backgroundColor = .black
    getData(link: "http://swapi.dev/api/starships")
  }
  
  func setupNavigationBar() {
    navigationItem.title = "List of Ships"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationController?.navigationBar.barTintColor = .gray
    navigationController?.navigationBar.backgroundColor = .black
    navigationController?.navigationBar.tintColor = .yellow
    
    navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow,
                                                                    .font: UIFont(name: "StarJediHollow",
                                                                                  size: 16.0) ?? .systemFont(ofSize: 16.0)]
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow,
                                                               .font: UIFont(name: "StarJediHollow",
                                                                             size: 16.0) ?? .systemFont(ofSize: 17.0)]
  }
  
  func setupTableView() {
    tableView = UITableView(frame: .zero, style: .plain)
    tableView.tableFooterView = UIView()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShipListCell")
    tableView.rowHeight = 100
    tableView.estimatedRowHeight = UITableView.automaticDimension
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shipList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "ShipListCell", for: indexPath)
    setupCell(cell: &cell, name: shipList[indexPath.row].name)
    return cell
  }
  
  func setupCell(cell: inout UITableViewCell, name: String) {
    let image = UIImage(systemName: "chevron.right")
    let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
    accessory.image = image
    accessory.tintColor = .yellow
    
    cell.backgroundColor = .black
    cell.textLabel?.numberOfLines = 0;
    cell.textLabel?.textColor = .yellow
    cell.textLabel?.font = UIFont(name: "StarJedi", size: 16.0) ?? .systemFont(ofSize: 16.0)
    cell.textLabel?.text = name
    cell.accessoryView = accessory
    cell.selectionStyle = .none
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = ShipDescriptionController()
    controller.starShip = shipList[indexPath.row]
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
        print(error)
        self?.presentAlert(withMessage: "It seems like we have some problems, check your internet connection and try again") {
          self?.getData(link: link)
        }
        
      }
    }
  }
  func presentAlert(withMessage message: String, completion: (() -> Void)?){
    let alertController = UIAlertController(title: "Something went wrong",
                                            message: message,
                                            preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Refresh",
                                    style: .default) { _ in completion?() }
    alertController.addAction(alertAction)
    self.present(alertController,
                 animated: true,
                 completion: nil)
    
  }
}





