//
//  User.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var id: String?
    var username: String?
    var avatarURL: String?

    func parseItemUser(with itemUser: JSON) {
        id = itemUser["id"].stringValue
        username = itemUser["username"].stringValue
        avatarURL = itemUser["avatarURL"].stringValue
    }
}


