//
//  RegViewController.swift
//  yasmine_claire
//
//  Created by T04-09 on 17/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreData

class RegViewController: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var repassword: UITextField!
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        if username.text == "" || password.text == "" || repassword.text == "" {
        let alert = UIAlertController(title: "Error", message: "Please enter values to all fields!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    //check if the password and retype pass do not match
        else if password.text != repassword.text {
            let alert = UIAlertController(title: "Error", message: "password and retype fields does not match!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
    }
        else {
            let fetchRequest: NSFetchRequest = Account.fetchRequest()
            let predicate: NSPredicate = NSPredicate(format: "username == %@", username.text!)
            fetchRequest.predicate = predicate
            do{
                let accounts = try viewContext.fetch(fetchRequest)
                
                //attempted retrieval of data actually returned a record,
                //this means that particular username already exist in the database
                if accounts.count > 0 {
                    let alert = UIAlertController(title: "Error", message: "username already exists.Please try with another one.", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(ok)
                    present(alert, animated: true, completion: nil)
                    
                }
                
                //proceed to register new user
                else{
                    let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: viewContext) as! Account
                    account.username = username.text
                    account.password = password.text
                    account.credits = 200
                    app.saveContext()
                    
                    let alert = UIAlertController(title: "Success!", message: "Your account has been registered successfully! Please proceed to login page to login  ", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(ok)
                    present(alert, animated: true, completion: nil)
                }

            }catch{
                print(error)
            }
            
            
        }
    }

}
