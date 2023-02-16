//
//  Comment.swift
//  techSocialMediaApp
//
//  Created by Snir Avrahami on 2/1/23.
//

import Foundation

struct Comment: Codable {
    var commentId: Int
    var body: String
    var userName: String
    var userId: UUID
    var createdDate: String
}
