//
//  Post.swift
//  JellyGram
//
//  Created by jelly on 19/06/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: Mappable {
    var id: Int?
    var image: String!
    var content: String!
    var username: String!
    var location: String?
    var profile: String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
        content <- map["content"]
        username <- map["username"]
        location <- map["location"]
        profile <- map["profile"]
    }
}
