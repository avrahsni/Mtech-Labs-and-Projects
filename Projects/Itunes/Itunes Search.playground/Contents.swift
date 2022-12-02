import UIKit

enum ItunesInfoError: Error, LocalizedError {
    case itemNotFound
    case imageDataMissing
}

Task {
    
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
//    let str: String = httpResponse.url?.dataRepresentation
    print(httpResponse)
    
}
