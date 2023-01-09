//
//  ViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/04.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    let animationView = LottieAnimationView(name: "gummyBear")
    
    var timer = Timer()
    var timePassed = TimePassed()
    var timeStatus: TimeStatus = .end
    
    enum TimeStatus {
        case start
        case pause
        case end
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        switch timeStatus {
        case .end:
            timeStatus = .start
            animationView.play()
            timeStart()
        case .start:
            timeStatus = .pause
            timer.invalidate()
            animationView.stop()
        case .pause:
            timeStatus = .start
            timeStart()
            animationView.play()
        }
    }
   
    private func timeStart() {
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

