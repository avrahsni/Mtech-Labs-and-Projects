//
//  PagesAPI.swift
//  Life-FormSearch
//
//  Created by Snir Avrahami on 1/23/23.
//

import Foundation

struct taxonConcept: Codable {
    let dataObjects: dataObjects?
    let taxonConcepts: taxonConcepts?
//    let identifier: Int
//    let scientificName: String
    
    enum CodingKeys: String, CodingKey {
        case dataObjects
        case taxonConcepts
//        case identifier
//        case scientificName
    }
}

struct taxonConcepts: Codable {
//    let identifier: Int
    let sourceIdentifier: Int
    let taxonRank: String
    let scientificName: String
    let name: String
}

struct dataObjects: Codable {
    let mediumType: String
    let dataType: String
    let mimeType: String
    
    let agents: [Credit]
    
    let eolMediaURL: String?
    let license: String
}

struct Credit: Codable {
    let homepage: String?
    let role: String
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
    case homepage
    case role
    case fullName = "full_name"
    }
}

struct PagesAPIRequest: APIRequest {
    var id: String
    let urlString1 = "https://eol.org/api/pages/1.0/"
    let urlString2 = ".json"
    var urlString: String
    
    var urlRequest: URLRequest {
        var urlComponents = URLComponents(string: "\(urlString1)\(id)\(urlString2)")!
        urlComponents.queryItems = [
            URLQueryItem(name: "taxonomy", value: "true"),
            URLQueryItem(name: "images_per_page", value: "1"),
            URLQueryItem(name: "language", value: "en")
            /*URLQueryItem(name: "api_key", value: apiKey)*/
        ]
        print(urlComponents.url)
        return URLRequest(url: urlComponents.url!)
    }
    
    func decodeResponse(data: Data) throws -> taxonConcept {
        let pageInfo = try JSONDecoder().decode(taxonConcept.self, from: data)
        print(pageInfo.dataObjects?.license)
        return pageInfo
    }
}
