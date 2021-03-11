//
//  shops.swift
//  yasmine_claire
//
//  Created by Rasiya on 2/3/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit

let listOfShops = ["Tampines Hub", "Compass One", "Northpoint Mall", "united square"]
let listOfArea = ["Tampines", "Sengkang", "Yishun", "Novena"]

class shops: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfShops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        
        cell.textLabel?.text = listOfShops[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("selected")
      performSegue(withIdentifier: "segueShopMap", sender: nil)
 }
   

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "segueShopMap" {
      let vc = segue.destination as? shopoutlets
      vc?.shopID = tableView.indexPathForSelectedRow?.row
    }
    }
}
