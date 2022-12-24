//
//  ViewController.swift
//  SymbolRoller
//
//  Created by 우주형 on 2022/12/24.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandom()
    }

    @IBAction func randomPressed(_ sender: UIButton) {
        generateRandom()
    }
    
    func generateRandom() {
        let symbol = symbols.randomElement()!
        animation()
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
    
    func animation() {
        let newBounds = CGRect(x: 0, y: 0, width: 500, height: 500)
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
            self.imageView.bounds = newBounds
        }
    }

}

