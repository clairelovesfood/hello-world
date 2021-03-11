//
//  CartViewController.swift
//  yasmine_claire
//
//  Created by T04-09 on 23/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit

var cartList: [CartModel] = []

   class CartCell: UITableViewCell{
    
    
       @IBOutlet weak var img: UIImageView!
       @IBOutlet weak var productdesc: UILabel!
       @IBOutlet weak var qty: UILabel!
       @IBOutlet weak var subtotal: UILabel! // is sub-price
    

   }

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var totalPriceLbl: UILabel!
    
    var total = 0
    
    override func viewDidLoad() {
           super.viewDidLoad()
                tableView.delegate = self
                tableView.dataSource = self
       }

       override func viewWillAppear(_ animated: Bool) {
           
               self.tableView.reloadData()
                var totalAmt = 0
            for cart in cartList {
                totalAmt += cart.subprice
            }
        totalPriceLbl.text = "\(totalAmt) credits"
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
        cell.imageView?.image = UIImage(named: cartList[indexPath.row].imgName)
        cell.productdesc.text = cartList[indexPath.row].desc
        cell.qty.text = "\(cartList[indexPath.row].txtfield)"
        cell.subtotal.text = "\(cartList[indexPath.row].subprice) credits"
        
        return cell 
    }
   

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "updateCart", sender: nil)
        }
    
         //this func will be invoked each time a segue is about to be performed from this view controller
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "updateCart" {
                if let target = segue.destination as? ProductDetailViewController {
                    target.productId = cartList[tableView.indexPathForSelectedRow!.row].id
                }
    
            }
    }
    
    func updateNetPrice(){
        total = 0
        for product in cartList {
            total += product.subprice
        }
        totalPriceLbl.text = "\(total) credits"
    }// this func is for the delete func(swipe then delete, it will be updated. In the page.)
    

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               cartList.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .fade)
               // call the function to recalculate total credits
               updateNetPrice()
               
           } else if editingStyle == .insert {
               // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
           }
       }
    
    
    @IBAction func checkout(_ sender: UIButton) {
    }
    
}
