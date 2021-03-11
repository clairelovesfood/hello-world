//
//  ProductModel.swift
//  yasmine_claire
//
//  Created by T04-09 on 22/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import Foundation

class ProductModel {
    var id: Int
    var desc: String
    var price: Int
    var imgName : String
    var unitPrice: Int
    
    init(id: Int, desc: String, price: Int, unitprice: Int, imgName: String) {
        self.id = id
        self.desc = desc
        self.price = price
        self.unitPrice = unitprice
        self.imgName = imgName
    }
}
