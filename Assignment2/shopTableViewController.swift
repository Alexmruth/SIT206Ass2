//
//  shopTableViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit

var item1Count : Int64 = 0
var item2Count : Int64 = 0
var item3Count : Int64 = 0

var price1 : Float = 10
var price2 : Float = 100
var price3 : Float = 5000

class shopTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    //var ViewController: ViewController?


    
    @IBOutlet weak var buyItem1Label: UILabel!
    @IBOutlet weak var buyItem2Label: UILabel!
    @IBOutlet weak var buyItem3Label: UILabel!
    @IBOutlet weak var item1PurchaseCount: UILabel!
    @IBOutlet weak var item2PurchaseCount: UILabel!
    @IBOutlet weak var item3PurchaseCount: UILabel!
    
    @IBAction func buyItem1(_ sender: UIButton) {
        
        if currentTomatoes >= price1 {
            perClick = perClick + 1;
            currentTomatoes = currentTomatoes - price1;
            price1 = price1 * 1.2;
            price1.round()
            
            item1Count = item1Count + 1;
            buyItem1Label.text = "\(price1)"
            currentTomatoLabel?.text = "\(currentTomatoes)"
            item1PurchaseCount.text = "\(item1Count)"
        } else {
            //add popup here
        }
    }
    @IBAction func buyItem2(_ sender: UIButton) {
        if currentTomatoes >= price2 {
            perClick = perClick + 2;
            currentTomatoes = currentTomatoes - price2;
            price2 = price2 * 1.2;
            price2.round()
            item2Count = item2Count + 1;
            buyItem2Label.text = "\(price2)"
            currentTomatoLabel?.text = "\(currentTomatoes)"
            item2PurchaseCount.text = "\(item2Count)"
        } else {
            //add popup here
        }
    }
   @IBAction func buyItem3(_ sender: UIButton) {
        if currentTomatoes >= price3 {
            autoPerClick = autoPerClick + 5;
            currentTomatoes = currentTomatoes - price3;
            price3 = price3 * 1.2;
            price3.round()
            item3Count = item3Count + 1;
            buyItem3Label.text = "\(price3)"
            currentTomatoLabel?.text = "\(currentTomatoes)"
            item2PurchaseCount.text = "\(item2Count)"
        } else {
            //add popup here
        }
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
