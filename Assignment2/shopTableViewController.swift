//
//  shopTableViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit



class shopTableViewController: UITableViewController {
    
    var item1Count : Int64 = 0
    var item2Count : Int64 = 0
    var item3Count : Int64 = 0
    var item4Count : Int64 = 0
    
    var CP1 : Float = 1
    var CP2 : Float = 2
    var CP3 : Float = 1
    
    var DP1Count = 0
    var DP2Count = 0
    var DP3Count = 0
    
    var price1 : Float = 10
    var price2 : Float = 100
    var price3 : Float = 500
    var price4 : Float = 1250
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    //var ViewController: ViewController?


    
    @IBOutlet weak var price1Label: UILabel!
    @IBOutlet weak var price2Label: UILabel!
    @IBOutlet weak var price3Label: UILabel!
    @IBOutlet weak var price4Label: UILabel!
    @IBOutlet weak var item1PurchaseCount: UILabel!
    @IBOutlet weak var item2PurchaseCount: UILabel!
    @IBOutlet weak var item3PurchaseCount: UILabel!
    @IBOutlet weak var item4PurchaseCount: UILabel!
    
    @IBOutlet weak var doublePower1: UIButton!
    @IBOutlet weak var doublePower2: UIButton!
    
    @IBAction func buyItem1(_ sender: UIButton) {
        
        if currentTomatoes >= price1 {
            perClick = perClick + CP1;
            currentTomatoes = currentTomatoes - price1;
            price1 = price1 * 1.1;
            price1.round()
            item1Count = item1Count + 1;
            price1Label.text = "\(price1)"
            item1PurchaseCount.text = "\(item1Count)"
            
            if item1Count >= 50 && DP1Count == 0 {
                doublePower1.isEnabled = true
                doublePower1.isHidden = false
            }
        } else {
            //add popup here
        }
    }
    @IBAction func buyItem2(_ sender: UIButton) {
        if currentTomatoes >= price2 {
            perClick = perClick + CP2;
            currentTomatoes = currentTomatoes - price2;
            price2 = price2 * 1.1;
            price2.round()
            item2Count = item2Count + 1;
            price2Label.text = "\(price2)"
            item2PurchaseCount.text = "\(item2Count)"
            
            if item2Count >= 50 && DP2Count == 0 {
                doublePower2.isEnabled = true
                doublePower2.isHidden = false
            }
        } else {
            //add popup here
        }
    }

    @IBAction func buyAuto1(_ sender: UIButton) {
        if currentTomatoes >= price3 {
            autoPerClick = autoPerClick + 5;
            currentTomatoes -= price3;
            price3 = price3 * 1.1;
            price3.round()
            item3Count = item3Count + 1;
            price3Label.text = "\(price3)"
            item3PurchaseCount.text = "\(item3Count)"
        } else {
            //add popup here
        }

    }
    @IBAction func buyAuto2(_ sender: UIButton) {
        if currentTomatoes >= price4 {
            autoPerClick = autoPerClick + 10;
            currentTomatoes = currentTomatoes - price4;
            price4 = price4 * 1.1;
            price4.round()
            item4Count = item4Count + 1;
            price4Label.text = "\(price4)"
            item4PurchaseCount.text = "\(item4Count)"
        } else {
            //add popup here
        }
    }


    @IBAction func doublePower1(_ sender: UIButton) {
        
        if currentTomatoes >= 5000 {
            currentTomatoes = currentTomatoes - 5000
            perClick = perClick + Float(item1Count)
            CP1 *= 2
            doublePower1.isEnabled = false
            doublePower1.isHidden = true
            DP1Count = 1
        }
    }
    @IBAction func doublePower2(_ sender: UIButton) {
        if currentTomatoes >= 12000 {
            currentTomatoes = currentTomatoes - 12000
            perClick = perClick + Float(item2Count)
            CP2 *= 2
            doublePower2.isEnabled = false
            doublePower2.isHidden = true
            DP2Count = 1
            
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
