//
//  GetPictureController.swift
//  Interview Prep Code Challenge 2
//
//  Created by Snir Avrahami on 2/27/23.
//

import Foundation
import UIKit

class GetPicturesController {
    enum ImageError: Error, LocalizedError {
        case couldNotFetchImages
    }
    
    
    func getPictures(_ url: String, _ position: Int) async throws -> (image: UIImage, pos: Int) {
        
        // Initialize our session and urlComponents
        let session = URLSession.shared
        let urlComponents = URLComponents(string: "\(url)")!
        
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
//        print(data)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let resp = response as? HTTPURLResponse
            print(resp?.statusCode ?? 1000)
            throw ImageError.couldNotFetchImages
        }
        
        // Decode our response data to a usable User struct
        let decoder = JSONDecoder()
        
        guard let image = UIImage(data: data) else {
            print("Error fetching image")
            return (UIImage(systemName: "person.circle")!, position)
        }
        
        
        return (image, position)
    }
}
