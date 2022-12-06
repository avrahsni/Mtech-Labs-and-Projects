//
//  RepresentativeInfoController.swift
//  APIProject
//
//  Created by Snir Avrahami on 12/6/22.
//

import UIKit

class RepresentativeInfoController: UIViewController {

    enum PhotoInfoError: Error, LocalizedError {
        case itemNotFound
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchRepData() async throws -> rep {
        var urlComponents = URLComponents(string: "http://whoismyrepresentative.com/getall_mems.php?")!
        urlComponents.queryItems = [
            "zip" : "84043",
            "output" : "json"
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        let repDataObject = try JSONDecoder().decode(rep.self, from: data)
        return repDataObject
        
    }
}
