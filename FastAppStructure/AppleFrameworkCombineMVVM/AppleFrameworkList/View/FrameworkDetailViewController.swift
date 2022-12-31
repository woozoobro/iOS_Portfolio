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
            
    var subscriptions = Set<AnyCancellable>()
    var viewModel: FrameworkDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        //input
        viewModel.buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                safari.modalPresentationStyle = .popover
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
        
        //output
        viewModel.framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
    }    

    @IBAction func learnMoreTapped(_ sender: UIButton) {
        viewModel.learnMoreTapped()
    }
    
}
