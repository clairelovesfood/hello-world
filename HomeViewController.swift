//
//  HomeViewController.swift
//  yasmine_claire
//
//  Created by T04-09 on 17/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreData

class FeaturedProducts: UITableViewCell {

    @IBOutlet weak var productimgview: UIImageView!

    @IBOutlet weak var productdesc: UILabel!

}
       
    var homeId : Int = 0

    var homeList : [HomeModel] = []



class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
let app = UIApplication.shared.delegate as! AppDelegate
        var viewContext: NSManagedObjectContext!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var username: UILabel!
      
      @IBOutlet weak var coins: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      viewContext = app.persistentContainer.viewContext
           username.text = currentUser
        tableView.dataSource = self
        tableView.delegate = self
        
    
          let fetchRequest: NSFetchRequest = Account.fetchRequest()
           let predicate: NSPredicate = NSPredicate(format: "username == %@", currentUser)
              fetchRequest.predicate = predicate
           do{
               let accounts = try viewContext.fetch(fetchRequest)
               for acct in accounts {
                   coins.text = "\(acct.credits)"

               }
           }catch{
               print(error)
           }

      if homeList.count == 0 {
          homeList.append(HomeModel(id: 1, desc: "brownies", imgName : "brownies"))
      
          homeList.append(HomeModel(id: 2, desc: "bubbletea", imgName : "bubbletea"))
      
          homeList.append(HomeModel(id: 3, desc: "korean chicken", imgName : "koreanchix"))
        
        homeList.append(HomeModel(id: 4, desc: "gin & tonic", imgName: "ginandtonic"))
        

      }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return homeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "featuredProducts") as! FeaturedProducts
            cell.productdesc.text = homeList[indexPath.row].desc
            cell.productimgview.image = UIImage(named: homeList[indexPath.row].imgName)
        return cell
    }
//    func tableView (_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "toProductDetail", sender: nil)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toProductDetail" {
//            if let target = segue.destination as? HomeViewController {
//                target.homeId = homeList[tableView.indexPathForSelectedRow!.row].id
//            }
//        }
//    }



}
