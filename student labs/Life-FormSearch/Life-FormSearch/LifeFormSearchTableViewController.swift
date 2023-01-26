//
//  LifeFormSearchTableViewController.swift
//  Life-FormSearch
//
//  Created by Snir Avrahami on 1/23/23.
//

import UIKit

protocol APIRequest {
    associatedtype Response
    
    var urlRequest: URLRequest { get }
    func decodeResponse (data: Data) throws -> Response
}

class LifeFormSearchTableViewController: UITableViewController {
    
    
//    var searchResultsArray = [result(id: 46577088, title: "Zebrasoma flavescens", content: "Yellow tang; Yellow Tang", link: "https://eol.org/pages/46577088")]
    var searchResultsArray = [result]()
    
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Search for a life form"
        sc.searchBar.delegate = self
        return sc
    }()
    
    
    enum APIRequestError: Error {
        case itemNotFound
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func sendRequest<Request: APIRequest>(_ request: Request) async throws -> Request.Response {
        let (data, response) = try await URLSession.shared.data(for: request.urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIRequestError.itemNotFound
        }
        
        let decodedResponse = try request.decodeResponse(data: data)
        return (decodedResponse)
    }
    
    
    func fetchLifeForms() {
        let searchString = searchController.searchBar.text ?? ""
        if searchString.isEmpty {
//            applyNewSnapshot(from: [])
            return
        }
        let searchRequest = SearchAPIRequest(apiKey: "", searchTerm: searchString)
        Task {
            do {
                let searchResults = try await sendRequest(searchRequest)
                print(searchResults.results[0].title)
                print(searchResults.results[0].link)
                searchResultsArray = searchResults.results
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResultsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lifeFormCellReuseIdentifier", for: indexPath) as! LifeFormTableViewCell
        
        let lifeForm = searchResultsArray[indexPath.row]
        
        cell.update(with: lifeForm)


        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let navVC = segue.destination as! UINavigationController
        let lfVC = navVC.viewControllers.first as! LifeFormViewController
        
        let cell = sender as! UITableViewCell
        // Pass the selected object to the new view controller.
        lfVC.lifeFormID = searchResultsArray[tableView.indexPathForSelectedRow!.row].id
    }
    
    
    
    
    
    
    
    
    

}

extension LifeFormSearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.isEmpty {
            fetchLifeForms()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchLifeForms()
    }
    
}
