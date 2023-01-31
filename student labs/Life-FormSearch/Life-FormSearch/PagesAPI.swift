//
//  PagesAPI.swift
//  Life-FormSearch
//
//  Created by Snir Avrahami on 1/23/23.
//

import Foundation
import UIKit

struct TaxonConcept: Codable {
    var accordingTo: String?
    var identifier: Int

    enum CodingKeys: String, CodingKey {
        case accordingTo = "nameAccordingTo"
        case identifier
    }
}

struct Agent: Codable {
    var fullName: String?
    var role: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case role
    }
}

struct DataObject: Codable {
    var eolMediaURL: URL?
    var mimeType: String?
    var license: String?
    var agents: [Agent]?
    var rightsHolder: String?
}

struct EOLItemDetails: Codable {
    var scientificName: String
    var dataObjects: [DataObject]?
    var taxonConcepts: [TaxonConcept]?
}

struct EOLItemDetail: Codable {
    var details: EOLItemDetails
    
    enum CodingKeys: String, CodingKey {
        case details = "taxonConcept"
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
        print(urlComponents.url!)
        return URLRequest(url: urlComponents.url!)
    }
    
    func decodeResponse(data: Data) throws -> EOLItemDetail? {
        data.prettyPrintedJSONString()
        let decoder = JSONDecoder()
        do {
            let pageInfo = try decoder.decode(EOLItemDetail.self, from: data)
            print(pageInfo)
            return pageInfo
        } catch {
            print("error decoding JSON: \(error)")
            return nil
        }
        
        
    }
}

struct ImageAPIRequest: APIRequest {
    var imageUrl: String
    
    var urlRequest: URLRequest {
//        var urlComponents = URLComponents(string: imageUrl)
        return URLRequest(url: URL(string: imageUrl)!)
    }
    
    func decodeResponse(data: Data) throws -> UIImage? {
        let decoder = JSONDecoder()
        guard let imageInfo = UIImage(data: data) else {
            print("Error fetching image")
            return nil
        }
        return imageInfo
    }
}
