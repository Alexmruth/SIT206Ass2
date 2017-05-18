//
//  ViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 2/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit
import AVFoundation

var currentTomatoes : Float = 0;
var totalTomatoes : Float = 0;
var perClick : Float = 1;
var autoPerClick : Float = 0;
var timesTapped : Float = 0;
var rain : Bool = false;

class ViewController: UIViewController {
    var timer: Timer?
    var tomatoTimer: Timer?
    var tomatoRainTimer: Timer?
    var endRain: Timer?
    var gravity : UIGravityBehavior?
    var animator : UIDynamicAnimator?
    //var progressView: UIProgressView?
    //var progressLabel: UILabel?
    
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0
    var songPause = false

    override func viewDidLoad() {
        super.viewDidLoad()
        //update timer
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
        //register an animator
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        let vector = CGVector(dx: 0.0, dy: 0.1) // gravity magnitude and direction
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
        
        let path = Bundle.main.path (forResource:"song", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        do{try soundPlayer = AVAudioPlayer(contentsOf: url)}
        catch {print("File not available")}
        if soundPlayer != nil {
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }
        self.progressBar.progress = 0;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tomato: UIButton!
    @IBOutlet weak var currentTomatoLabel: UILabel!
    @IBOutlet weak var autoPerSecondLabel: UILabel!
    @IBOutlet weak var perClickLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    func update() {
        currentTomatoes += (autoPerClick / 10)
        //roundf(currentTomatoes)
        currentTomatoLabel.text = "\(Int(currentTomatoes))"
        perClickLabel.text = "\(Int(perClick))"
        autoPerSecondLabel.text = "\(Int(autoPerClick))"
    }
    
    
    @IBAction func tomatoClicked(_ sender: UIButton) {
        currentTomatoes += perClick
        timesTapped += 0.01;
        self.progressBar.progress = timesTapped;
        
        if progressBar.progress == 1 {
            rain = true
            timesTapped = 0
            progressBar.progress = 0
            
            tomatoRainTimer = Timer.scheduledTimer(timeInterval: 0.2,  target: self, selector: #selector(ViewController.tomatoRain(_ :)), userInfo: nil, repeats: true )
            endRain = Timer.scheduledTimer(timeInterval: 10,  target: self, selector: #selector(ViewController.endRain(_ :)), userInfo: nil, repeats: false )
        }
    }
    
    func tinyTomatoClicked(sender : UIButton) {
        sender.setImage(UIImage(named: "exploded"), for: .normal)
        UIView.animate(withDuration: 0.4, animations: {sender.alpha = 0}, completion: { (true) in sender.removeFromSuperview()})
        currentTomatoes += 10 + (currentTomatoes / 10)
    }
    
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
    func endRain(_ : Any){
        tomatoRainTimer?.invalidate()
    }
    
    @IBAction func testTomatoes(_ sender: UIButton) {
        currentTomatoes = currentTomatoes + 100000;
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Warning", message : "Are you sure you want to reset your progress?", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Yes", style: .default, handler:
            {
                (action) in alertController.dismiss(animated: true, completion: nil)
                currentTomatoes = 0;
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
