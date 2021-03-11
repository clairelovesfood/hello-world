//
//  OrderSummViewController.swift
//  yasmine_claire
//
//  Created by Rasiya on 27/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreData

var finalizedPrice : Int = 0


class OrderSummViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(cartList.count)
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toPickUp", for: indexPath) as! OrderSummViewController
    }
    
    
    
    let app = UIApplication.shared.delegate as! AppDelegate
       var viewContext: NSManagedObjectContext!

    
    @IBOutlet weak var noOfItemsLbl: UILabel!
    
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    @IBOutlet weak var discountedPrice: UILabel!
    
    @IBOutlet weak var aftDiscPrice: UILabel!
    
    @IBOutlet weak var segCtrl: UISegmentedControl!
    
    @IBOutlet weak var segCtrl2: UISegmentedControl!

      var shake:Bool = false
    
    var disc = 0.0
    var total = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext

        discountedPrice.isHidden = true
        

        
        var totalItems = 0
        for cart in cartList{
            totalItems += cart.txtfield
        }
        noOfItemsLbl.text = "\(totalItems)"
        
        var totalPrice = 0
        for cart in cartList {
            totalPrice += cart.subprice
        }
        totalPriceLbl.text = "\(totalPrice)"
        
        discountedPrice.text = totalPriceLbl.text
        
        aftDiscPrice.text = aftDiscPrice.text
    }
    

         override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
                   
               if motion == .motionShake {
                   if shake == true {
                   let alert = UIAlertController(title: "Oops!", message: "You already have generated a discount!", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "OK", style: .default)
                   alert.addAction(okAction)
                   present(alert, animated: true, completion: nil)
                   
                   
                   
               } else {
                       discountedPrice.isHidden = false
                   let discountPercentage = Int.random(in: 0...20)
                   discountedPrice.text = "\(discountPercentage)"
                    let discountedPriceA = (Int(totalPriceLbl.text!)! * Int(discountedPrice.text!)!) / 100
                       finalizedPrice = Int(totalPriceLbl.text!)! - discountedPriceA
//                       discountedPrice.text = "\(finalizedPrice)"
                       
                       let alert = UIAlertController(title: "Your discount is \(discountPercentage)%", message: "Congratulations", preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "OK", style: .default)
                       alert.addAction(okAction)
                       present(alert, animated: true, completion: nil)
                    
                    aftDiscPrice.text = "\(finalizedPrice) credits"
                       
                   shake = true

                   }
                   
                   
                   }
           }
    
  
        
    func updateNetPrice(){
        total = 0
        for product in cartList {
            total += Int(product.subprice)
        }
        totalPriceLbl.text = "Total Amount: \(total) credits"
    }
    
    func checkCredits() {
                   
                   do {
                       let fetchRequest: NSFetchRequest = Account.fetchRequest()
                       let predicate: NSPredicate = NSPredicate(format: "username == %@", currentUser)
                       fetchRequest.predicate = predicate
                       let allAccounts = try viewContext.fetch(fetchRequest)
                       for accounts in allAccounts {
                           if finalizedPrice > accounts.credits {
                           let errorAlert = UIAlertController(title: "Error", message: "Insufficient amount of credits.", preferredStyle: .alert)
                           let okAction = UIAlertAction(title: "OK", style: .default)
                           errorAlert.addAction(okAction)
                           present(errorAlert, animated: true, completion: nil)
                           }
                        
                       }
                   }
                catch {
              print(error)
               }
                   
                 
           }
    
    
    @IBAction func btnPlaceOrder(_ sender: UIButton){
        
        // 1. check if user has sufficient credits
        
        // 2a. if got enough credits,
        //    process the purchase => deduct discounted amount from their current credits
        //    if selected pickup,
        //        go to pickp scene
        //    else,
        //       go to delivery scene
        
        // 2b. else (not enough credits)
        //    inform user that they do not have enough money
        
    
    if discountedPrice.isHidden == true {
                let errorAlert = UIAlertController(title: "Error", message: "Please kindly shake your device to receive a discount!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                errorAlert.addAction(okAction)
                present(errorAlert, animated: true, completion: nil)
            }
            else {
            checkCredits()
            switch segCtrl.selectedSegmentIndex {
                
            case 0:
                 performSegue(withIdentifier: "toPickUp", sender: nil)
            case 1:
                performSegue(withIdentifier: "toDelivery", sender: nil)

            default:
                return
                }
            }
            }

        
    }
  

    

