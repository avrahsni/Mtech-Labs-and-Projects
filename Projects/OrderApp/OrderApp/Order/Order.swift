//
//  Order.swift
//  OrderApp
//
//  Created by Snir Avrahami on 12/16/22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
