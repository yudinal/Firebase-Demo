//
//  Item.swift
//  Firebase-Demo
//
//  Created by Lilia Yudina on 3/2/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

struct Item {
    let itemName: String
    let price: Double
    let itemId: String // document ID
    let listedDate: Date
    let sellerName: String
    let sellerId: String
    let categoryName: String
}

extension Item {
    init(_ dictionary: [String: Any]) {
        self.itemName = dictionary["itemName"] as? String ?? "no item name"
        self.price = dictionary["price"] as? Double ?? 0.0
        self.itemId = dictionary["itemId"] as? String ?? "no item id"
        self.listedDate = dictionary["listedDate"] as? Date ?? Date()
        self.sellerName = dictionary["sellerName"] as? String ?? "no seller name"
        self.sellerId = dictionary["sellerId"] as? String ?? "no seller id"
        self.categoryName = dictionary["categoryName"] as? String ?? "no category name"
    }
}
