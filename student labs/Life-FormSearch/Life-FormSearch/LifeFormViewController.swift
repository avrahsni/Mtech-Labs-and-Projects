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
    
    var lifeFormID: Int = 46577088
    var lifeFormTaxonArr = [taxonConcept]()
    
    
//    init?(lifeFormID: Int, coder: NSCoder) {
//        self.lifeFormID = lifeFormID
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchLifeForms()
//        licenseLink.text = lifeFormTaxonArr[0].dataObjects?[0].license
    }
    
    
    func fetchLifeForms() {
        
        let pageRequest = PagesAPIRequest(id: String(lifeFormID), urlString: "https://eol.org/api/pages/1.0/\(lifeFormID).json")
        Task {
            do {
                let pageResults = try await sendRequestTemplate().sendRequest(pageRequest)
//                print(pageResults.dataObjects![0].license)
                lifeFormTaxonArr.append(pageResults)
                print(lifeFormID)
                print(lifeFormTaxonArr[0].taxonConcepts?.scientificName)
                print(lifeFormTaxonArr[0].dataObjects?.eolMediaURL)
//                print(searchResults.results[0].link)
//                searchResultsArray = pageResults.results
//                tableView.reloadData()
            } catch {
                print(error)
            }
        }
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
