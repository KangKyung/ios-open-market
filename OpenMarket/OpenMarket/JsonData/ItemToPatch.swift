//
//  ItemToPatch.swift
//  OpenMarket
//
//  Created by sole on 2021/01/26.
//

import Foundation

struct ItemToPatch: Encodable {
    
    var title: String?
    var discription: String?
    var price: Int?
    var currency: String?
    var stock: Int?
    var discountedPrice: Int?
    var images: [Data]?
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case title, discription, price, currency, stock, images, password
        case discountedPrice = "discounted_price"
    }
}
