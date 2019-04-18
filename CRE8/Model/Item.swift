//
//  Item.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import Foundation
import SwiftyJSON

class Item {
    var id: String
    var title: String?
    var content: String?
    var tags: String?
    var association: Association?
    var location: Location?
    var info: Info?
    var identifierSet: String?
    var amountSet: String?
    var reactions: Reaction?
    var user: User


    init(id: String, user: User) {
        self.id = id
        self.user = user
    }

    static func parseItems(json: JSON) -> [Item] {
        var newItems = [Item]()
        print(json)
        return newItems
    }
}
