//
//  RepresentativeInfoController.swift
//  APIProject
//
//  Created by Snir Avrahami on 12/6/22.
//

import UIKit

class RepresentativeInfoController: UIViewController {

    enum RepInfoError: Error, LocalizedError {
        case itemNotFound
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchRepData(matching query: [String: String]) async throws -> [rep] {
        var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_mems.php")!
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RepInfoError.itemNotFound
        }
        print(data)
        let decoder = JSONDecoder()
        let repDataObject = try decoder.decode(SearchResponse.self, from: data)
        
        return repDataObject.results
        
    }
}
