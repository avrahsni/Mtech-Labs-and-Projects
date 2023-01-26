//
//  HierarchyAPI.swift
//  Life-FormSearch
//
//  Created by Snir Avrahami on 1/23/23.
//

import Foundation

struct Hierarchy: Codable {
    let taxonConceptID: Int
    let entry: [String]?
    let sourceIdentifier: Int
    let taxonID: Int
    let parentNameUsageID: Int
    let source: String
    let children: [String]?
    let scientificName: String
    let taxonRank: String?
    let ancestors: [Ancestor]?
}

struct Ancestor: Codable {
    let source: String
    let taxonConceptID: Int
    let taxonID: Int
    let sourceIdentifier: Int
    let taxonRank: String
    let parentNameUsageID: Int
    let scientificName: String
}
