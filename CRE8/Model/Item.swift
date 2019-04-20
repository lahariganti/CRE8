//
//  Item.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftSoup

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
    var user: User?


    init(id: String) {
        self.id = id
    }

    static func parseItems(json: JSON) -> [Item] {
        var newItems = [Item]()
        for (k, v) in json[0] {
            if k == "content" {
                print(v)
            }
        }
        for n in (0...json.count) {
            let newItem = Item(id: json[n]["id"].stringValue)
            newItem.title = json[n]["title"].stringValue
            let content = json[n]["content"].stringValue
            newItem.content = content
            let user = User()
            user.parseItemUser(with: json[n]["user"])
            newItem.user = user
            newItems.append(newItem)
        }
        return newItems
    }
}
