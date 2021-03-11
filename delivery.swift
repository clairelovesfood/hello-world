//
//  delivery.swift
//  yasmine_claire
//
//  Created by T04-09 on 3/3/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreData

class delivery: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
   
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var contact: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var deliver: UISegmentedControl!
    
    @IBAction func btnNext(_ sender: UIButton)
    {
        if name.text == "" || contact.text == "" || address.text == "" {
        let alert = UIAlertController(title: "Error", message: "Please enter values inside username and password", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    } else{
            
                        switch deliver.selectedSegmentIndex {
                            
                        case 0:
                        performSegue(withIdentifier: "toDeliverNow", sender: nil)
                        case 1:
                            performSegue(withIdentifier: "ToDeliverTmr", sender: nil)

                        default:
                            return
                            }
                        }
                        
                    }

            }
        
        
    

//if details are correct, go to delivery pages.

