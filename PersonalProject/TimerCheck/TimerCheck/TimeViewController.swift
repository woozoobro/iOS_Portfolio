//
//  TimeViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/04.
//

import UIKit
import Lottie

protocol TimeViewControllerDelegate: AnyObject {
    func didSavedTime(data: TimeModel)
}

class TimeViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    let animationView = LottieAnimationView(name: "heartPopUp")    
    
    weak var delegate: TimeViewControllerDelegate?
    
    var timer = Timer()
    var timeModel = TimeModel()
    var timeStatus: TimeStatus = .end
    
    enum TimeStatus {
        case start
        case pause
        case end
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        setButtonTitle(with: "시작하기")
        startButton.layer.cornerRadius = 50
        startButton.layer.masksToBounds = true
        configureLottieView()
               
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        startButton.addGestureRecognizer(longPressGesture)
    }
    
    @objc func longPress(gesture: UIGestureRecognizer) {
        if let longPress = gesture as? UILongPressGestureRecognizer {
            if longPress.state == UIGestureRecognizer.State.began {
                timer.invalidate()
                setButtonTitle(with: "시작하기")
                timeStatus = .end
                animationView.stop()
                let data = TimeModel(seconds: timeModel.seconds, minutes: timeModel.minutes, hours: timeModel.hours, date: timeModel.date)
                delegate?.didSavedTime(data: data)
                                                
                resetTimeModel()
                setTimeLabel()
            }
        }
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
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.timeModel.seconds += 1
            if self.timeModel.seconds == 60 {
                self.timeModel.seconds = 0
                self.timeModel.minutes += 1
                
                if self.timeModel.minutes == 60 {
                    self.timeModel.minutes = 0
                    self.timeModel.hours += 1
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
            self.timeLabel.text = self.timeModel.currentTimetoString(sec: self.timeModel.seconds, min: self.timeModel.minutes, hour: self.timeModel.hours)
        }
    }
    
    private func resetTimeModel() {
        timeModel.seconds = 0
        timeModel.minutes = 0
        timeModel.hours = 0
    }
    
    
}
