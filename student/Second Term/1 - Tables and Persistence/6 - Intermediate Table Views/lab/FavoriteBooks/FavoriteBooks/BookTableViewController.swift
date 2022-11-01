import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        tableView.estimatedRowHeight = 146
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let BookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
//
            let book = books[indexPath.row]
//            var content = cell.defaultContentConfiguration()
//            content.text = book.title
//            content.secondaryText = book.description
//            cell.contentConfiguration = content
//
//            cell.showsReorderControl = true
            BookTableViewCell.update(with: book)

            return BookTableViewCell
        }
        return tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
    }

    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedBook = books.remove(at: sourceIndexPath.row)
        books.insert(movedBook, at: destinationIndexPath.row)
    }
    
    
    
    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? BookFormTableViewController,
            let book = source.book else {return}
        print(book)
        if let indexPath = tableView.indexPathForSelectedRow {
            books.remove(at: indexPath.row)
            books.insert(book, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
            print("book: \(books[indexPath.row])")
            print("row: \(indexPath.row)")
            print("\(books.count)")
        } else {
            books.append(book)
            print(books.count)
        }
    }
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return nil }

        let book = books[indexPath.row]

        return BookFormTableViewController(coder: coder, book: book)
    }
    

    
    
    
    
    
}
