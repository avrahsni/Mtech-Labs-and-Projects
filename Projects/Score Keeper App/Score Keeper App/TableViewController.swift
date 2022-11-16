//
//  TableViewController.swift
//  Score Keeper App
//
//  Created by Snir Avrahami on 11/7/22.
//

import UIKit



class TableViewController: UITableViewController, scored {
    func playerScored(cell: UITableViewCell, step: Int) {
//        players[indexPath.row].score += step
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        players[indexPath.row].score = step
        animateChanges(player: players[indexPath.row], indexPath: indexPath)
        reorderPlayers()
//        tableView.reloadData()
        print(players)
    }
    
    
    var players = [Player]()
    var scores = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 136.0
        
        players = Player.loadFromFile() ?? [Player]()
        
        updateScores()
        
        reorderPlayers()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        
        let player = players[indexPath.row]
        
        cell.showsReorderControl = false
        
        cell.update(with: player)
        
        cell.delegate = self

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            Player.saveToFile(players: players)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func reorderPlayers() {
        guard players.count > 1 else { return }
        func playerSort(this: Player, that: Player) -> Bool {
            return this.score > that.score
        }
        players.sort(by: playerSort(this:that:))
        Player.saveToFile(players: players)
        tableView.reloadData()
    }
    
    func animateChanges(player: Player, indexPath: IndexPath)
    {
        if indexPath.row > 0 {
            if player.score > players[indexPath.row - 1].score {
                tableView.moveRow(at: IndexPath(row: indexPath.row, section: 0), to: IndexPath(row: indexPath.row - 1, section: 0))
                tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0), IndexPath(row: indexPath.row - 1, section: 0)], with: .fade)
            }
        }
        
        if indexPath.row < players.count - 1 {
            if player.score < players[indexPath.row + 1].score {
                tableView.moveRow(at: IndexPath(row: indexPath.row, section: 0), to: IndexPath(row: indexPath.row + 1, section: 0))
                tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0), IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
            }
        }
        
    }
    
    
    func updateScores() {
        while players.count > scores.count {
            scores.append(0)
        }
        for i in 0..<players.count {
            scores[i] = players[i].score
        }
        reorderPlayers()
    }
    
    func updatePlayerScores() {
        while players.count < scores.count {
            players.append(Player(name: "", score: 0))
        }
        for i in 0..<scores.count {
            players[i].score = scores[i]
        }
        reorderPlayers()
    }
    
    // MARK: - Navigation
    
    @IBSegueAction func addPlayerSegue(_ coder: NSCoder, sender: Any?) -> AddPlayerViewController? {
        return AddPlayerViewController(coder: coder)
    }
    
    
    @IBAction func unwindToTableView(_ unwindSegue: UIStoryboardSegue, sender: Any?) {
        guard /*segue.identifier == "saveUnwind",*/ let sourceViewController = unwindSegue.source as? AddPlayerViewController, let player = sourceViewController.player else { return }


        let newIndexPath = IndexPath(row: players.count, section: 0)
        players.append(player)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        
        reorderPlayers()
        
        Player.saveToFile(players: players)
        print("Save Button Pressed")
    }
    

    
    
}
