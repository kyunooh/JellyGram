//
//  PostApi.swift
//  JellyGram
//
//  Created by jelly on 25/06/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import Foundation
import Moya

enum PostApi {
    case posts
    case post(postId: Int)
}
