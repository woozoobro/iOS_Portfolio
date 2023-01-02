//
//  ViewController.swift
//  pomodoroTimer
//
//  Created by 우주형 on 2023/01/02.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    enum TimeStatus {
        case start
        case pause
        case end
    }
    
    var duration = 60
    var timeStatus: TimeStatus = .end
    var timer: DispatchSourceTimer?
    var currentSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStartButton()
    }
    
    func startTimer() {
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            timer?.schedule(deadline: .now(), repeating: 1)
            timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
                let hours = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
                
                UIView.animate(withDuration: 0.5, delay: 0) {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
                }
                UIView.animate(withDuration: 0.5, delay: 0.5) {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
                }
                
                if self.currentSeconds <= 0 {
                    //타이머가 종료
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005)
                }
            })
            timer?.resume()
        }
    }
    
    func stopTimer() {
        if timeStatus == .pause {
            timer?.resume()
        }
        timeStatus = .end
        UIView.animate(withDuration: 0.5) {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
            self.imageView.transform = .identity
        }
        startButton.isSelected = false
        cancelButton.isEnabled = false
        timer?.cancel()
        timer = nil
    }
    
    func setTimerViewVisible(isHidden: Bool) {
        timerLabel.isHidden = isHidden
        progressView.isHidden = isHidden
    }
    
    func configureStartButton() {
        startButton.setTitle("시작", for: .normal)
        startButton.setTitle("일시정지", for: .selected)
    }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        switch timeStatus {
        case .start, .pause:
            stopTimer()
        case .end:
            break
        }
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        duration = Int(datePicker.countDownDuration)
        switch timeStatus {
        case .end:
            currentSeconds = duration
            timeStatus = .start
            UIView.animate(withDuration: 0.5) {
                self.timerLabel.alpha = 1
                self.progressView.alpha = 1
                self.datePicker.alpha = 0
            }
            startButton.isSelected = true
            cancelButton.isEnabled = true
            startTimer()
        case .start:
            timeStatus = .pause
            startButton.isSelected = false
            timer?.suspend()
        case .pause:
            timeStatus = .start
            startButton.isSelected = true
            timer?.resume()
        }
    }
    
    
}

