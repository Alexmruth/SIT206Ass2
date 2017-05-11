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
var perClick : Float = 1;
var autoPerClick : Float = 0;

 extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%0.F", self) : String(self)
    }
}

class ViewController: UIViewController {
    var timer: Timer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func update() {
        currentTomatoes = currentTomatoes + (autoPerClick / 20)
        currentTomatoLabel.text = "\(currentTomatoes)"
        perClickLabel.text = "\(perClick)"
        autoPerSecondLabel.text = "\(autoPerClick)"
    }
    
    

    @IBAction func tomatoClicked(_ sender: UIButton) {
        currentTomatoes = currentTomatoes + perClick + upgradeModifier

    }
    
    @IBOutlet weak var tomato: UIButton!
	@IBOutlet weak var currentTomatoLabel: UILabel!
    @IBOutlet weak var autoPerSecondLabel: UILabel!
    
    @IBAction func testTomatoes(_ sender: UIButton) {
        currentTomatoes = currentTomatoes + 100000;
    }


    @IBOutlet weak var perClickLabel: UILabel!

    
}

