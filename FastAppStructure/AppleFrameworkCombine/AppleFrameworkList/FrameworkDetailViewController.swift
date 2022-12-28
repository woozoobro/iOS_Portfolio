//
//  FrameworkDetailViewController.swift
//  AppleFrameworkList
//
//  Created by 우주형 on 2022/12/27.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
        
    // Combine
    let learnMoreTapped = PassthroughSubject<AppleFramework, Never>()
    var subscriptions = Set<AnyCancellable>()
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "Unknown", imageName: "", urlString: "", description: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        //input
        learnMoreTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                safari.modalPresentationStyle = .popover
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
        
        //output
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
    }    

    @IBAction func learnMoreTapped(_ sender: UIButton) {
        learnMoreTapped.send(framework.value)
    }
    
}
