//
//  HomeModel.swift
//  yasmine_claire
//
//  Created by T04-09 on 24/2/21.
//  Copyright © 2021 ite. All rights reserved.
//

import Foundation

class HomeModel {
    var id: Int
    var desc: String

    var imgName : String
    
    init(id: Int, desc: String,  imgName: String) {
        self.id = id
        self.desc = desc

        self.imgName = imgName
    }
}
