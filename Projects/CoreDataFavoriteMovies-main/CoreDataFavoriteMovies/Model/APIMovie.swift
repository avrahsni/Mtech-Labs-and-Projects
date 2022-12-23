//
//  APIMovie.swift
//  CoreDataFavoriteMovies
//
//  Created by Parker Rushton on 11/5/22.
//

import Foundation

struct SearchResponse: Codable {
    let movies: [APIMovie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct APIMovie: Codable, Identifiable, Hashable {
    let title: String
    let year: String
    let imdbID: String
    let posterURL: URL?
    
    var id: String { imdbID }

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case posterURL = "Poster"
    }

}

extension Movie {
    var posterURL: URL? {
        return URL(string: posterURLString ?? "https://images2.memedroid.com/images/UPLOADED54/524dde0e6668e.jpeg")
    }
    
}
