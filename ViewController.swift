//
//  ViewController.swift
//  yasmine_claire
//
//  Created by T04-09 on 16/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreData

var currentUser: String = ""

class ViewController: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
   @IBOutlet weak var txtusername: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if txtusername.text == "" || txtpassword.text == "" {
        let alert = UIAlertController(title: "Error", message: "PLease enter values inside username and password", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    } else{
                let fetchRequest: NSFetchRequest = Account.fetchRequest()
                let predicate: NSPredicate = NSPredicate(format: "username == %@ AND password == %@", txtusername.text!, txtpassword.text!)
                fetchRequest.predicate = predicate
                
                //do the actual query
                do{
                    let accounts = try viewContext.fetch(fetchRequest)
                    
                    //there is no matching record with the username and password provided by the user
                    if accounts.count == 0 {
                        let alert = UIAlertController(title: "Error", message: "username and password is incorrect!", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(ok)
                        present(alert, animated: true, completion: nil)
      
                    } else {
                        //there is matching record
                        currentUser = txtusername.text!
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let MainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(MainTabBarController)
                        
                    }
                    
                }catch{
                    print(error)
                }
            }
        }
        
    }
