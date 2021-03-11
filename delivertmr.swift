//
//  delivertmr.swift
//  yasmine_claire
//
//  Created by T04-09 on 4/3/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreData
class delivertmr: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnConfirm(_ sender: UIButton)
    {
           let alert = UIAlertController(title: "Success", message: "Kindly wait for your food to be delivered the following day. Thank you.", preferredStyle: .alert)
           let ok = UIAlertAction(title: "OK", style: .default)
           alert.addAction(ok)
           present(alert, animated: true, completion: nil)
       }
                           
                       }


