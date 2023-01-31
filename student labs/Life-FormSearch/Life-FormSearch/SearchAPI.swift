//
//  SearchResults.swift
//  Life-FormSearch
//
//  Created by Snir Avrahami on 1/23/23.
//

import Foundation

struct SearchResult: Codable {
    let itemsPerPage: Int
    let results: [result]
    let totalResults: Int
    let startIndex: Int
    
    enum CodingKeys: String, CodingKey {
        case itemsPerPage
        case results
        case totalResults
        case startIndex
    }
}

struct result: Codable {
    let id: Int
    let title: String
    let content: String
    let link: String
}

enum APIRequestError: Error {
    case itemNotFound
}

struct sendRequestTemplate {
    
    func sendRequest<Request: APIRequest>(_ request: Request) async throws -> Request.Response {
        let (data, response) = try await URLSession.shared.data(for: request.urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIRequestError.itemNotFound
        }
        
        let decodedResponse = try request.decodeResponse(data: data)
        return (decodedResponse)
    }
}



struct SearchAPIRequest: APIRequest {
    var searchTerm: String
    
    var urlRequest: URLRequest {
        var urlComponents = URLComponents(string: "https://eol.org/api/search/1.0.json")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: searchTerm)
        ]
        
        return URLRequest(url: urlComponents.url!)
    }
    
    func decodeResponse(data: Data) throws -> SearchResult {
        let searchInfo = try JSONDecoder().decode(SearchResult.self, from: data)
//        print(searchInfo.totalResults)
        return searchInfo
    }
}
