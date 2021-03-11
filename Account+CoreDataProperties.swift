//
//  Account+CoreDataProperties.swift
//  yasmine_claire
//
//  Created by T04-09 on 17/2/21.
//  Copyright © 2021 ite. All rights reserved.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var credits: Int16
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}


extension Account : Identifiable {

}
