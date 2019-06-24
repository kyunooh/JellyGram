//
//  User.swift
//  JellyGram
//
//  Created by jelly on 23/06/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var id: Int!
    var name: String!
    var username: String!
    var email: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
    }
}
