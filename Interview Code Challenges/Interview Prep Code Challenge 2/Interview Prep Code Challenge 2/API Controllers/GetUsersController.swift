//
//  GetUsersController.swift
//  Interview Prep Code Challenge 2
//
//  Created by Snir Avrahami on 2/27/23.
//

import Foundation

class GetUsersController {
    enum UserError: Error, LocalizedError {
        case couldNotFetchUsers
    }
    
    
    func getUsers(amount: Int) async throws -> [User] {
        
        // Initialize our session and urlComponents
        let session = URLSession.shared
        var urlComponents = URLComponents(string: "\(API.url)")!
        
        // Add the query items
        if amount > 1 {
            urlComponents.queryItems = [
                URLQueryItem(name: "results", value: "\(amount)")
            ]
        }
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
//        print(data)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let resp = response as? HTTPURLResponse
            print(resp?.statusCode ?? 1000)
            throw UserError.couldNotFetchUsers
        }
        
        // Decode our response data to a usable User struct
        let decoder = JSONDecoder()
        let usersResponse = try decoder.decode(Response.self, from: data)
        
        let users = usersResponse.results
        
        return users
    }
}
