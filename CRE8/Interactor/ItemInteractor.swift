//
//  ItemInteractor.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ItemInteractor {
    static let shared = ItemInteractor()

    func fetchItems(completionHandler: @escaping (([Item], Error?) -> Void)) {
        let params: [String: Any] = ["limit" : 25, "sort": "DESC"]
        Alamofire.request(Database.itemRef, method: .get, parameters: params, encoding: URLEncoding.default).responseJSON { response in
            if response.result.isSuccess {
                guard let value = response.result.value else { return completionHandler([], nil)}
                let itemJSON: JSON = JSON(value)
                completionHandler(Item.parseItems(json: itemJSON), nil)
            } else {
                print("Connection Issues")
            }
        }
    }
}
