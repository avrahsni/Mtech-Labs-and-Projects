//
//  StoreItemTableViewDiffableDataSource.swift
//  iTunesSearch
//
//  Created by Snir Avrahami on 1/31/23.
//

import UIKit

@MainActor
class StoreItemTableViewDiffableDataSource: UITableViewDiffableDataSource<String, StoreItem> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section]
    }
}
