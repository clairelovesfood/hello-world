//
//  Customer+CoreDataProperties.swift
//  yasmine_claire
//
//  Created by T04-09 on 4/3/21.
//  Copyright © 2021 ite. All rights reserved.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var name: String?
    @NSManaged public var phonenumber: Int16
    @NSManaged public var address: String?

}
