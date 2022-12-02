//
//  ITunesController.swift
//  ItunesGuidedProject
//
//  Created by Snir Avrahami on 12/2/22.
//

import UIKit

class ITunesController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    enum ItunesInfoError: Error, LocalizedError {
        case itemNotFound
        case imageDataMissing
    }
    
    func fetchITunesInfo() async throws -> ITunesInfo {
        
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
        urlComponents.queryItems = [
            "country": "us",
            "term": "elvis_presley",
            "media": "music"
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ItunesInfoError.itemNotFound
        }
        print(httpResponse)
        let itunesInfoObject = try JSONDecoder().decode(ITunesInfo.self, from: data)
        return itunesInfoObject
        
    }

}
