//
//  ViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit

var currentTomatoes : UInt64 = 0;
var totalTomatoes : UInt64 = 0;
var upgradeModifier : UInt64 = 0;
public var perClick : UInt64 = 1;

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

