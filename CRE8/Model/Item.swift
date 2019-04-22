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
    var user: User
    var title: String?
    var content: String?
    var itemImageString: String?
    var tags: String?
    var association: Association?
    var location: Location?
    var info: Info?
    var identifierSet: String?
    var amountSet: String?
    var reactions: Reaction?


    init(id: String, user: User) {
        self.id = id
        self.user = user
    }

    static func parseItems(json: JSON) -> [Item] {
        var newItems = [Item]()
        for n in (0...json.count) {
            let itemID = json[n]["id"].stringValue
            let itemUser = User()
            let newItem = Item(id: itemID, user: itemUser)

            newItem.title = json[n]["title"].stringValue
            let content = json[n]["content"].stringValue
            newItem.content = content
            do {
                let doc: Document = try SwiftSoup.parse(content)
                let srcs: Elements = try doc.select("img[src]")
                let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
                print(newItem.title, srcsStringArray)
                if !srcsStringArray.isEmpty {
                    newItem.itemImageString = srcsStringArray[0]
                }
            } catch Exception.Error(_, let message) {
                print(message)
            } catch {
                print("error")
            }
            newItem.user.parseItemUser(with: json[n]["user"])
            newItems.append(newItem)
                  print("----")
        }
        return newItems
    }
}
