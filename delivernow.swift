//
//  delivernow.swift
//  yasmine_claire
//
//  Created by T04-09 on 4/3/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit
import CoreData
class delivernow: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!


    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
}
