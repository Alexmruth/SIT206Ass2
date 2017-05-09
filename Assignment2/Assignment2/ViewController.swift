//
//  ViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit

var currentTomatoes : Float = 0;
var totalTomatoes : Float = 0;
var upgradeModifier : Float = 0;
public var perClick : Float = 1;
public var autoPerClick : Float = 0;
var currentTomatoLabel: UILabel!

class ViewController: UIViewController {
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func update() {
        currentTomatoes = currentTomatoes + autoPerClick
        currentTomatoLabel.text = "\(currentTomatoes)"
        perClickLabel.text = "\(perClick)"
    }
    
    @IBAction func testTomatoes(_ sender: UIButton) {
        currentTomatoes = currentTomatoes + 1000;
        currentTomatoLabel.text = "\(currentTomatoes)"
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

