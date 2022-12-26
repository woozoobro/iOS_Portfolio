//
//  FrameworkDetailViewController.swift
//  AppleFrameworkList
//
//  Created by 우주형 on 2022/12/27.
//

import UIKit
import SafariServices

class FrameworkDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        imageView.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    }
    
    @IBAction func learnMoreTapped(_ sender: UIButton) {
        
        guard let url = URL(string: framework.urlString) else { return }
        
        let safari = SFSafariViewController(url: url)
        safari.modalPresentationStyle = .popover
        present(safari, animated: true)
    }
    
}
