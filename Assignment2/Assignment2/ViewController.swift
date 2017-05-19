//
//  ViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit
import AVFoundation

var currentTomatoes : Float = 0
var totalTomatoes : Float = 0
var perClick : Float = 1
var autoPerClick : Float = 0
var timesTapped : Float = 0
var rain : Bool = false

class ViewController: UIViewController {
    var timer: Timer?
    var tomatoTimer: Timer?
    var tomatoRainTimer: Timer?
    var endRain: Timer?
    var resetTimer: Timer?
    var gravity : UIGravityBehavior?
    var animator : UIDynamicAnimator?
    
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0
    var songPause = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // AUTO UPDATE TIMER *****
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
        // ANIMATION CODE *****
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        let vector = CGVector(dx: 0.0, dy: 0.1) // gravity magnitude and direction
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
        
        // AUDIO PLAYER CODE *****
        let path = Bundle.main.path (forResource:"song", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        do{try soundPlayer = AVAudioPlayer(contentsOf: url)}
        catch {print("File not available")}
        if soundPlayer != nil {
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // OUTLETS *****
    @IBOutlet weak var tomato: UIButton!
    @IBOutlet weak var currentTomatoLabel: UILabel!
    @IBOutlet weak var autoPerSecondLabel: UILabel!
    @IBOutlet weak var perClickLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    // AUTO UPDATE FUNCTION *****
    func update() {
        currentTomatoes += (autoPerClick / 10)
        currentTomatoLabel.text = "\(Int(currentTomatoes))"
        perClickLabel.text = "\(Int(perClick))"
        autoPerSecondLabel.text = "\(Int(autoPerClick))"
        progressBar.progress = timesTapped
    }
    
    // BIG TOMATO BUTTON FUNCTION *****
    @IBAction func tomatoClicked(_ sender: UIButton) {
        currentTomatoes += perClick // INCREASES TOMATOES ACCORDING TO CLICK POWER
        timesTapped += 0.01 // USED FOR PROGRESS BAR
        self.progressBar.progress = timesTapped
        
        // IF-FUNCTION WHICH ACTIVATES TOMATO RAIN AFTER PROGRESS BAR IS FULL
        if progressBar.progress == 1 {
            rain = true
            timesTapped = 0
            progressBar.progress = 0
            
            tomatoRainTimer = Timer.scheduledTimer(timeInterval: 0.2,  target: self, selector: #selector(ViewController.tomatoRain(_ :)), userInfo: nil, repeats: true )
            endRain = Timer.scheduledTimer(timeInterval: 10,  target: self, selector: #selector(ViewController.endRain(_ :)), userInfo: nil, repeats: false )
        }
    }
    
    // TOMATO RAIN FUNCTION 88888
    func tomatoRain(_ : Any){
        //pick random x position for tomato
        let xCoordiante = arc4random() % UInt32(self.view.bounds.width)
        //create a button, set image, assign touchUpInside handler, add it to the view and gravity animator
        let btn = UIButton(frame: CGRect(x: Int(xCoordiante), y: 0, width: 50, height: 50))
        btn.setImage(UIImage(named: "smallTomato"), for: .normal)
        btn.addTarget(self, action: #selector(self.tinyTomatoClicked(sender:)), for: .touchUpInside )
        self.view.addSubview(btn)
        gravity?.addItem( (btn as UIView))
    }
    
    // TINY TOMATO ONCE CLICKED FOR TOMATO RAIN *****
    func tinyTomatoClicked(sender : UIButton) {
        sender.setImage(UIImage(named: "exploded"), for: .normal)
        UIView.animate(withDuration: 0.4, animations: {sender.alpha = 0}, completion: { (true) in sender.removeFromSuperview()})
        currentTomatoes += 10 + (currentTomatoes / 20) // GIVES BONUS TOMATOES
    }

    // ENDS THE TOMATO RAIN TIMER *****
    func endRain(_ : Any){
        tomatoRainTimer?.invalidate()
    }
    
    // 100,000 TOMATOES USED FOR QUICK TESTING PURPOSES *****
    @IBAction func testTomatoes(_ sender: UIButton) {
        currentTomatoes = currentTomatoes + 100000;
    }
    
    // RESEST BUTTON *****
    @IBAction func resetButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Warning", message : "Are you sure you want to reset your progress?", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Yes", style: .default, handler:
            {
                (action) in alertController.dismiss(animated: true, completion: nil)
                
                currentTomatoes = 0
                perClick = 0
                autoPerClick = 0
                timesTapped = 0
                item1Count = 0
                item2Count = 0
                item3Count = 0
                item4Count = 0
                item1AutoCount = 0
                item2AutoCount = 0
                price1 = 15
                price2 = 100
                price3 = 1100
                price4 = 12000
                price5 = 135000
                price1Auto = 500
                price2Auto = 1250
                CP1 = 1
                CP2 = 2
                CP3 = 10
                CP4 = 45
                DP1 = 0
                DP2 = 0
                DP3 = 0
                DP4 = 0
                DP5 = 0
        })
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: {
            (action) in alertController.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(resetAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func sound(_ sender: UIButton) {
        if songPause == false && soundPlayer != nil {
            elapsedTime = soundPlayer!.currentTime
            soundPlayer!.pause()
            songPause = true
            sender.setImage(UIImage(named: "mute.png"), for:   UIControlState())
        } else {
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
            songPause = false
            sender.setImage(UIImage(named: "nomute.png"), for:   UIControlState())
        }
    }

}
