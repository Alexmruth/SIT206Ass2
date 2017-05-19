//
//  shopTableViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit
// PUBLIC VARIABLES *****
var item1Count : Float = 0
var item2Count : Float = 0
var item3Count : Float = 0
var item4Count : Float = 0
var item5Count : Float = 0

var item1AutoCount : Float = 0
var item2AutoCount : Float = 0

var price1 : Float = 15
var price2 : Float = 100
var price3 : Float = 1100
var price4 : Float = 12000
var price5 : Float = 135000

var price1Auto : Float = 500
var price2Auto : Float = 1250

var CP1 : Float = 1
var CP2 : Float = 2
var CP3 : Float = 10
var CP4 : Float = 45
var CP5 : Float = 360

var DP1 = 0
var DP2 = 0
var DP3 = 0
var DP4 = 0
var DP5 = 0

class shopTableViewController: UITableViewController {
    var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // AUTO UPDATE TIMER
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }


    // OUTLETS *****
    @IBOutlet weak var clickPowerLabel1: UILabel!
    @IBOutlet weak var clickPowerLabel2: UILabel!
    @IBOutlet weak var clickPowerLabel3: UILabel!
    @IBOutlet weak var clickPowerLabel4: UILabel!
    @IBOutlet weak var clickPowerLabel5: UILabel!
    
    @IBOutlet weak var price1Label: UILabel!
    @IBOutlet weak var price2Label: UILabel!
    @IBOutlet weak var price3Label: UILabel!
    @IBOutlet weak var price4Label: UILabel!
    @IBOutlet weak var price5Label: UILabel!
    @IBOutlet weak var price1AutoLabel: UILabel!
    @IBOutlet weak var price2AutoLabel: UILabel!
    
    @IBOutlet weak var item1PurchaseCount: UILabel!
    @IBOutlet weak var item2PurchaseCount: UILabel!
    @IBOutlet weak var item3PurchaseCount: UILabel!
    @IBOutlet weak var item4PurchaseCount: UILabel!
    @IBOutlet weak var item5PurchaseCount: UILabel!
    @IBOutlet weak var item1AutoPurchaseCount: UILabel!
    @IBOutlet weak var item2AutoPurchaseCount: UILabel!
    
    @IBOutlet weak var doublePower1: UIButton!
    @IBOutlet weak var doublePower2: UIButton!
    @IBOutlet weak var doublePower3: UIButton!
    @IBOutlet weak var doublePower4: UIButton!
    @IBOutlet weak var doublePower5: customButton!
    
    // AUTO UPDATE TIMER - MAINLY USED FOR UPDATING LABELS ONCE GAME IS RESET
    func update(){
        price1Label.text = "\(Int(price1))"
        item1PurchaseCount.text = "\(Int(item1Count))"
        price2Label.text = "\(Int(price2))"
        item2PurchaseCount.text = "\(Int(item2Count))"
        price3Label.text = "\(Int(price3))"
        item3PurchaseCount.text = "\(Int(item3Count))"
        price4Label.text = "\(Int(price4))"
        item4PurchaseCount.text = "\(Int(item4Count))"
        clickPowerLabel1.text = "+\(Int(CP1)) click"
        clickPowerLabel2.text = "+\(Int(CP2)) click"
        clickPowerLabel3.text = "+\(Int(CP3)) click"
        clickPowerLabel4.text = "+\(Int(CP4)) click"
        price1AutoLabel.text = "\(Int(price1Auto))"
        item1AutoPurchaseCount.text = "\(Int(item1AutoCount))"
        price2AutoLabel.text = "\(Int(price2Auto))"
        item2AutoPurchaseCount.text = "\(Int(item2AutoCount))"
    }
    
    // ALERT POP UP FUNCTION WHEN PLAYER HAS INSUFFICIENT FUNDS
    func cantAfford() {
        let alertController = UIAlertController(title: "Sorry!", message : "Insufficient tomatoes", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Okay", style: .default, handler:
            {
                (action) in alertController.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(resetAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // BUY ITEM 1-5 BUTTONS ARE FOR CLICK POWER UPGRADES
    @IBAction func buyItem1(_ sender: UIButton) {
        
        if currentTomatoes >= price1 {
            perClick = perClick + CP1; // INCREASES CLICK POWER
            currentTomatoes = currentTomatoes - price1;
            price1 = 15 * powf(1.15, item1Count); // INCREASES PRICE OF ITEM ONCE PURCHASED
            price1.round()
            item1Count = item1Count + 1;
            price1Label.text = "\(Int(price1))"
            item1PurchaseCount.text = "\(Int(item1Count))"
            
            // DOUBLE POWER BUTTON VALIDATION
            if item1Count >= 25 && DP1 == 0 {
                doublePower1.isEnabled = true
                doublePower1.isHidden = false
            }
        } else {
            cantAfford() // CALLS THE ALERT CONTROLLER FUNCTION
        }
    }
    @IBAction func buyItem2(_ sender: UIButton) {
        if currentTomatoes >= price2 {
            perClick = perClick + CP2;
            currentTomatoes = currentTomatoes - price2;
            price2 = 100 * powf(1.15, item2Count);
            price2.round()
            item2Count = item2Count + 1;
            price2Label.text = "\(Int(price2))"
            item2PurchaseCount.text = "\(Int(item2Count))"
            
            if item2Count >= 25 && DP2 == 0 {
                doublePower2.isEnabled = true
                doublePower2.isHidden = false
            }
        } else {
            cantAfford()
        }
    }
    @IBAction func buyItem3(_ sender: UIButton) {
        if currentTomatoes >= price3 {
            perClick = perClick + CP3;
            currentTomatoes = currentTomatoes - price3;
            price3 = 1100 * powf(1.15, item3Count);
            price3.round()
            item3Count = item3Count + 1;
            price3Label.text = "\(Int(price3))"
            item3PurchaseCount.text = "\(Int(item3Count))"
            
            if item3Count >= 25 && DP3 == 0 {
                doublePower3.isEnabled = true
                doublePower3.isHidden = false
            }
        } else {
            cantAfford()
        }
    }
    @IBAction func buyItem4(_ sender: UIButton) {
        if currentTomatoes >= price4 {
            perClick = perClick + CP4;
            currentTomatoes = currentTomatoes - price4;
            price4 = 12000 * powf(1.15, item4Count);
            price4.round()
            item4Count = item4Count + 1;
            price4Label.text = "\(Int(price4))"
            item4PurchaseCount.text = "\(Int(item4Count))"
            
            if item4Count >= 25 && DP4 == 0 {
                doublePower4.isEnabled = true
                doublePower4.isHidden = false
            }
        } else {
            cantAfford()
        }
    }
    @IBAction func buyItem5(_ sender: UIButton) {
        if currentTomatoes >= price5 {
            perClick = perClick + CP5;
            currentTomatoes = currentTomatoes - price5;
            price5 = 135000 * powf(1.15, item5Count);
            price5.round()
            item5Count = item5Count + 1;
            price5Label.text = "\(Int(price5))"
            item5PurchaseCount.text = "\(Int(item5Count))"
            
            if item5Count >= 25 && DP4 == 0 {
                doublePower5.isEnabled = true
                doublePower5.isHidden = false
            }
        } else {
            cantAfford()
        }
    }
    
    // DOUBLE POWER 1-5 DOUBLE THE CLICKING POWER OF THAT ITEM
    @IBAction func doublePower1(_ sender: UIButton) {
        
        if currentTomatoes >= 5000 && DP1 == 0{
            currentTomatoes = currentTomatoes - 5000
            perClick = perClick + (item1Count * CP1) // DOUBLES PREVIOUSLY PURCHASED LEVELS AS WELL
            CP1 *= 2 // DOUBLES CLICK POWER
            clickPowerLabel1.text = "+\(Int(CP1)) click"
            DP1 = 1
            // REMOVES BUTTON
            doublePower1.isEnabled = false
            doublePower1.isHidden = true
        } else {
            cantAfford()
        }
    }
    @IBAction func doublePower2(_ sender: UIButton) {
        if currentTomatoes >= 12000 {
            currentTomatoes = currentTomatoes - 12000
            perClick = perClick + (item2Count * CP2)
            CP2 *= 2
            clickPowerLabel2.text = "+\(Int(CP2)) click"
            doublePower2.isEnabled = false
            doublePower2.isHidden = true
            DP2 = 1
        } else {
            cantAfford()
        }
    }
    @IBAction func doublePower3(_ sender: UIButton) {
        if currentTomatoes >= 130000 {
            currentTomatoes = currentTomatoes - 130000
            perClick = perClick + (item3Count * CP3)
            CP3 *= 2
            clickPowerLabel3.text = "+\(Int(CP3)) click"
            doublePower3.isEnabled = false
            doublePower3.isHidden = true
            DP3 = 1
        } else {
            cantAfford()
        }
    }
    @IBAction func doublePower4(_ sender: UIButton) {
        if currentTomatoes >= 16445000 {
            currentTomatoes = currentTomatoes - 16445000
            perClick = perClick + (item5Count * CP5)
            CP5 *= 2
            clickPowerLabel5.text = "+\(Int(CP5)) click"
            doublePower5.isEnabled = false
            doublePower5.isHidden = true
            DP5 = 1
        } else {
            cantAfford()
        }
    }
    @IBAction func doublePower5(_ sender: customButton) {
        if currentTomatoes >= 1430000 {
            currentTomatoes = currentTomatoes - 1430000
            perClick = perClick + (item4Count * CP4)
            CP4 *= 2
            clickPowerLabel4.text = "+\(Int(CP4)) click"
            doublePower4.isEnabled = false
            doublePower4.isHidden = true
            DP4 = 1
        } else {
            cantAfford()
        }
    }
    
    // BUY AUTO 1 & 2 ARE FOR AUTO CLICKER ITEMS
    @IBAction func buyAuto1(_ sender: UIButton) {
        if currentTomatoes >= price1Auto {
            autoPerClick = autoPerClick + 5;
            currentTomatoes -= price1Auto;
            price1Auto = price1Auto * 1.1;
            price1Auto.round()
            item1AutoCount += 1;
            price1AutoLabel.text = "\(Int(price1Auto))"
            item1AutoPurchaseCount.text = "\(Int(item1AutoCount))"
        } else {
            cantAfford()
        }

    }
    @IBAction func buyAuto2(_ sender: UIButton) {
        if currentTomatoes >= price2Auto {
            autoPerClick = autoPerClick + 10;
            currentTomatoes -= price2Auto;
            price2Auto = price2Auto * 1.1;
            price2Auto.round()
            item2AutoCount += 1;
            price2AutoLabel.text = "\(Int(price2Auto))"
            item2AutoPurchaseCount.text = "\(Int(item2AutoCount))"
        } else {
            cantAfford()
        }
    }
}
