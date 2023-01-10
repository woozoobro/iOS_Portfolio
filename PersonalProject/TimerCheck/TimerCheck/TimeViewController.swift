//
//  TimeViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/04.
//

import UIKit
import Lottie

class TimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    let animationView = LottieAnimationView(name: "heartPopUp")
    
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
        setButtonTitle(with: "시작하기")
        startButton.layer.cornerRadius = 50
        startButton.layer.masksToBounds = true
        configureLottieView()
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        startButton.addGestureRecognizer(longPressGesture)
    }
    
    @objc func longPress() {
        timer.invalidate()
        setButtonTitle(with: "시작하기")
        timeStatus = .end
        animationView.stop()
        timePassed.secondsPassed = 0
        timePassed.minutesPassed = 0
        timePassed.houresPassed = 0
        setTimeLabel()
        print(timePassed.date)
    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        switch timeStatus {
        case .end:
            timeStatus = .start
            animationView.play()
            timeStart()
            setButtonTitle(with: "일시정지")
            
        case .start:
            timeStatus = .pause
            timer.invalidate()
            animationView.stop()
            setButtonTitle(with: "다시시작")
            
            
        case .pause:
            timeStatus = .start
            timeStart()
            animationView.play()
            setButtonTitle(with: "일시정지")
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
            self.setTimeLabel()
        })
    }
    
    private func setButtonTitle(with titleKey: String) {
        if let attrFont = UIFont(name: "Helvetica", size: 40) {
            startButton.titleLabel?.text = titleKey
            let title = startButton.titleLabel?.text
            let attrTitle = NSAttributedString(string: title ?? "error", attributes: [NSAttributedString.Key.font: attrFont])
            startButton.setAttributedTitle(attrTitle, for: .normal)
        }
    }
    
    private func configureLottieView() {
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
    }
    
    private func setTimeLabel() {
        DispatchQueue.main.async {
            self.timeLabel.text = self.timePassed.currentTimetoString(sec: self.timePassed.secondsPassed, min: self.timePassed.minutesPassed, hour: self.timePassed.houresPassed)
        }
    }
    
}

