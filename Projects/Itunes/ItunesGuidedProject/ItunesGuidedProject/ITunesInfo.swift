//
//  ITunesInfo.swift
//  ItunesGuidedProject
//
//  Created by Snir Avrahami on 12/2/22.
//

import Foundation

struct ITunesInfo: Codable {
    //This struct is used in 'JSON USAGE 3' as the type the decoder uses as an output
    
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    var mediaType: String
    
    //Used in encoding and decoding to map keys (like from JSON) to property names.  Use this when your property names do not exactly match the keys in the incoming JSON (or other codable format).
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
        case mediaType = "media_type"
    }
}
