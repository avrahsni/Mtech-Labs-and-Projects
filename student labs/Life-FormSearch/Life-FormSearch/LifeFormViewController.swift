//
//  LifeFormViewController.swift
//  Life-FormSearch
//
//  Created by Snir Avrahami on 1/23/23.
//

import UIKit

class LifeFormViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var licenseLink: UILabel!
    @IBOutlet weak var taxonSourceLinkLabel: UILabel!
    @IBOutlet weak var scientificNameLabel: UILabel!
    
    var lifeFormID: Int = 46577088
    var lifeFormData = [EOLItemDetail?]()
    var searchResult: String = ""
    
    
//    init?(searchResult: String, coder: NSCoder) {
//        self.searchResult = searchResult
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = searchResult
        imageView.image = UIImage(systemName: "exclamationmark.octagon")
        if let image = fetchLifeForms() {
            imageView.image = image
        }
        
        
//        licenseLink.text = lifeFormTaxonArr[0].dataObjects?[0].license
    }
    
    
    func fetchLifeForms() -> UIImage? {
        
        let pageRequest = PagesAPIRequest(id: String(lifeFormID), urlString: "https://eol.org/api/pages/1.0/\(lifeFormID).json")
        
        Task {
            do {
                print(lifeFormData.count)
                let pageResults = try await sendRequestTemplate().sendRequest(pageRequest)
//                print(pageResults.dataObjects![0].license)
                print(lifeFormData.count)
                lifeFormData.append(pageResults ?? nil)
                print(lifeFormData.count)
                
                creatorNameLabel.text = lifeFormData[0]?.details.dataObjects?[0].rightsHolder
                licenseLink.text = lifeFormData[0]?.details.dataObjects?[0].license
                scientificNameLabel.text = lifeFormData[0]?.details.scientificName
                
                
                
                return fetchImage()
            } catch {
                print(error)
            }
            return nil
        }
        return nil
    }
    
    func fetchImage() -> UIImage? {
        print(lifeFormData.count)
        let imageRequest = ImageAPIRequest(imageUrl: lifeFormData[0]?.details.dataObjects?[0].eolMediaURL?.absoluteString ?? "error error error")
        print(imageRequest.imageUrl)
        Task {
            do {
                let image = try await sendRequestTemplate().sendRequest(imageRequest)
                imageView.backgroundColor = .clear
                imageView.image = image
                return image
            } catch {
                print("Error fetching image: \(error)")
                return nil
            }
        }
        
        return nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Data {
    func prettyPrintedJSONString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON Object.")
            return
        }
        print(prettyJSONString)
    }
}
