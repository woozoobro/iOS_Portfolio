//
//  ViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var timer: Timer?
    var timePassed = TimePassed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.timePassed.secondsPassed += 1
            if self.timePassed.secondsPassed == 60 {
                self.timePassed.secondsPassed = 0
                self.timePassed.minutesPassed += 1
                
                if self.timePassed.minutesPassed == 60 {
                    self.timePassed.minutesPassed = 0
                    self.timePassed.houresPassed += 1
                }
            }
            DispatchQueue.main.async {
                self.timeLabel.text = self.timePassed.currentTimetoString(sec: self.timePassed.secondsPassed, min: self.timePassed.minutesPassed, hour: self.timePassed.houresPassed)
            }
        })
    }
   
    
}

