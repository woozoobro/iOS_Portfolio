//
//  ViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var secondsPassed = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.secondsPassed += 1
            DispatchQueue.main.async {
                self.timeLabel.text = "\(self.secondsPassed) 초"
            }
        })
    }
    
}

