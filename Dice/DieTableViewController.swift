//
//  DieTableViewController.swift
//  Dice
//
//  Created by Sina on 3/1/17.
//  Copyright © 2017 Sina. All rights reserved.
//

import UIKit

class DieTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var dice = [Die]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleDie()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return dice.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "DieTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DieTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of DieTableViewCell")
        }

        // Fetches the appropriate Die for the data source layout.
        let Die = dice[indexPath.row]
        
        cell.dieLabel.text = Die.name
        cell.photoImageView.image = Die.photo
        cell.ratingControl.rating = Die.rating

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    //MARK: Private Methods
    
    private func loadSampleDie() {
        let photo1 = UIImage(named: "d20-colors")
        let photo2 = UIImage(named: "TwentySided")
        let photo3 = UIImage(named: "TwentyBlank")
        
        guard let die1 = Die(name: "d20-colors", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate die")
        }
        
        guard let die2 = Die(name: "TwentySided", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate die2")
        }
        
        guard let die3 = Die(name: "TwentyBlank", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate die3")
        }
        
        //fix die dice issue
        dice += [die1, die2, die3]
    }
    
    
}
