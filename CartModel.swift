//
//  CartModel.swift
//  yasmine_claire
//
//  Created by T04-09 on 23/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import Foundation

class CartModel {
    
    var id: Int
    var desc: String
    var Price: Int
    var imgName : String
    var txtfield: Int
    var subprice : Int
    
    init(id: Int, desc: String, Price: Int, imgName: String, txtfield: Int, subprice : Int) {
        self.id = id
        self.desc = desc
        self.Price = Price
        self.imgName = imgName
        self.txtfield = txtfield
        self.subprice = subprice
    }
}
