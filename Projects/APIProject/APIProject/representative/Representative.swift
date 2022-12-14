//
//  Representative.swift
//  APIProject
//
//  Created by Snir Avrahami on 12/6/22.
//

import Foundation

struct rep: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case party = "party"
        case state = "state"
        case district = "district"
        case phone = "phone"
        case link = "link"
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        party = try values.decode(String.self, forKey: CodingKeys.party)
        state = try values.decode(String.self, forKey: CodingKeys.state)
        district = try values.decode(String.self, forKey: CodingKeys.district)
        phone = try values.decode(String.self, forKey: CodingKeys.phone)
        link = try values.decode(String.self, forKey: CodingKeys.link)

//        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
//            self.description = description
//        } else {
//            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
//            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
//        }
    }
}

struct SearchResponse: Codable {
    let results: [rep]
}
