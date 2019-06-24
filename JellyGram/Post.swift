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
    var userId: Int!
    var id: Int!
    var title: String!
    var body: String!
    var username: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}
