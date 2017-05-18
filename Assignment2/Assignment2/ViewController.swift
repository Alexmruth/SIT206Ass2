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
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.00f", self) : String(self)
    }
}

class ViewController: UIViewController {
    var timer: Timer?
    var tomatoTimer: Timer?
    var gravity : UIGravityBehavior?
    var animator : UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
        tomatoTimer = Timer.scheduledTimer(timeInterval: 5,  target: self, selector: #selector(ViewController.addTomato(_ :)), userInfo: nil, repeats: true)
        //register an animator
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        let vector = CGVector(dx: 0.0, dy: 0.1) // gravity magnitude and direction
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
            }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tomato: UIButton!
    @IBOutlet weak var currentTomatoLabel: UILabel!
    @IBOutlet weak var autoPerSecondLabel: UILabel!
    @IBOutlet weak var perClickLabel: UILabel!
    
    func update() {
        currentTomatoes += (autoPerClick / 10)
        //roundf(currentTomatoes)
        currentTomatoLabel.text = "\(Int(currentTomatoes))"
        perClickLabel.text = "\(perClick)"
        autoPerSecondLabel.text = "\(autoPerClick)"
    }
    
    @IBAction func tomatoClicked(_ sender: UIButton) {
        currentTomatoes += perClick + upgradeModifier
        
    }
    
    func addTomato(_ : Any) {
        //pick random x position for balloon
        let xCoordiante = arc4random() % UInt32(self.view.bounds.width)
        //create a button, set image, assign touchUpInside handler, add it to the view and gravity animator
        let btn = UIButton(frame: CGRect(x: Int(xCoordiante), y: 0, width: 50, height: 50))
        btn.setImage(UIImage(named: "smallTomato"), for: .normal)
        btn.addTarget(self, action: #selector(self.tinyTomatoClicked(sender:)), for: .touchUpInside )
        self.view.addSubview(btn)
        gravity?.addItem( (btn as UIView))
        
    }
    
    func tinyTomatoClicked(sender : UIButton) {
        sender.setImage(UIImage(named: "exploded"), for: .normal)
        UIView.animate(withDuration: 0.4, animations: {sender.alpha = 0}, completion: { (true) in sender.removeFromSuperview()})
        currentTomatoes += 10 + (currentTomatoes / 10)
    }
    
    
    @IBAction func testTomatoes(_ sender: UIButton) {
        currentTomatoes = currentTomatoes + 100000;
    }

}
