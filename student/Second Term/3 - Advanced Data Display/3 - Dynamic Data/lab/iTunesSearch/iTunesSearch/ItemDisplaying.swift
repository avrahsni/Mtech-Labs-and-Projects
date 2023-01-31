//
//  ItemDisplaying.swift
//  iTunesSearch
//
//  Created by Snir Avrahami on 1/30/23.
//

import UIKit

protocol ItemDisplaying {
    var itemImageview: UIImageView! { get set }
    var titleLabel: UILabel! { get set }
    var detailLabel: UILabel! { get set }
}

@MainActor
extension ItemDisplaying {
    func configure(for item: StoreItem, storeItemController: StoreItemController) async {
        titleLabel.text = item.name
        detailLabel.text = item.artist
        itemImageview.image = UIImage(systemName: "photo")
        
        do {
            let image = try await storeItemController.fetchImage(from: item.artworkURL)
            
            self.itemImageview.image = image
        } catch let error as NSError where error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
            // Ignore cancellation errors
        } catch {
            self.itemImageview.image = UIImage(systemName: "photo")
            print("Error fetching image: \(error)")
        }
    }
}
