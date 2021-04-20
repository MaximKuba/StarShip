//
//  ShipDescriptionController.swift
//  StarShip
//
//  Created by Maxim Kuba on 19.04.2021.
//

import UIKit

class ShipDescriptionController: UIViewController {
  
  var navigationTitle: String = "Detail"


  override func viewDidLoad() {
    super.viewDidLoad()
            self.navigationItem.title = navigationTitle
            self.navigationController?.navigationBar.prefersLargeTitles = true
    self.view.backgroundColor = .white
  }


}
