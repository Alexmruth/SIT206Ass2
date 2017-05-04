//
//  ViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit

var currentTomatoes : Int64 = 0;
var totalTomatoes : Int64 = 0;
var upgradeModifier : Int64 = 0;
public var perClick : Int64 = 1;
var currentTomatoLabel: UILabel!

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBOutlet weak var tomato: UIButton!
	@IBOutlet weak var currentTomatoLabel: UILabel!
    
    @IBAction func tomatoClicked(_ sender: UIButton) {
        currentTomatoes = currentTomatoes + perClick + upgradeModifier
        currentTomatoLabel.text = "\(currentTomatoes)"
        perClickLabel.text = "\(perClick)"
    }

    @IBOutlet weak var perClickLabel: UILabel!
    
    
}

