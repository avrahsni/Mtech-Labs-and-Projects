//
//  DogInfoController.swift
//  APIProject
//
//  Created by Snir Avrahami on 12/6/22.
//

import UIKit

class DogInfoController: UIViewController {
    
    enum PhotoInfoError: Error, LocalizedError {
        case itemNotFound
        case imageDataMissing
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchDogImageData() async throws -> dog {
        var urlComponents = URLComponents(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        let photoInfoObject = try JSONDecoder().decode(dog.self, from: data)
        print("structure: \(photoInfoObject)\n")
        return photoInfoObject
        
    }
    
    func fetchDogImage(_ url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PhotoInfoError.imageDataMissing
        }
        guard let image = UIImage(data: data) else {
            throw PhotoInfoError.imageDataMissing
        }
        return image
    }
    

}
