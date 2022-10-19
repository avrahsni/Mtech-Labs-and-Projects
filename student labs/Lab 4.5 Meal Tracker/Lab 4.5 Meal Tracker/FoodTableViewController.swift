//
//  FoodTableViewController.swift
//  Lab 4.5 Meal Tracker
//
//  Created by Snir Avrahami on 10/18/22.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
//        var mealArray = [Meal]()
//        mealArray.append(Meal(name: "Breakfast", food: []))
//        mealArray.append(Meal(name: "Lunch", food: []))
//        mealArray.append(Meal(name: "Dinner", food: []))
        
        var breakfast = Meal(name: "Breakfast", food: [])
        var lunch = Meal(name: "Lunch", food: [])
        var dinner = Meal(name: "Dinner", food: [])
        
        var waffles = Food(name: "Waffles", description: "A Donkey's Favorite Food")
        var orangeJuice = Food(name: "Orange Juice", description: "Good For Washing Down Waffles")
        var maple = Food(name: "Maple Syrup", description: "A Sweet Syrup to put on your waffles")
        
        var onionSoup = Food(name: "Onion Soup", description: "A soup made with onions, good for the immune system and loved by ogres")
        var water = Food(name: "Water", description: "Standard water, the best drink for a good lunch")
        var cake = Food(name: "Cake", description: "Cakes have layers too, they're a good dessert")
        
        breakfast.food = [waffles, orangeJuice, maple]
        lunch.food = [onionSoup, water, cake]
        dinner.food = [waffles, water, maple]
        
        var mealArray = [breakfast, lunch, dinner]
        return mealArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        let num = indexPath.section
        let meal = meals[0]
        return meal.food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)

        // Configure the cell...
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
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
