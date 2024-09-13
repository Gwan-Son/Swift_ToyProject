//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by 심관혁 on 3/5/24.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    let learnMoreButtonTapped = PassthroughSubject<AppleFramework,Never>()
    let selectedFramework = CurrentValueSubject<AppleFramework,Never>(AppleFramework(name: "Unknown", imageName: "", urlString: "", description: ""))
    
    @IBOutlet weak var frameworkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    private func bind() {
        // UI update
        selectedFramework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.frameworkImage.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
        
        // ButtonTapped
        learnMoreButtonTapped
            .receive(on: RunLoop.main)
            .compactMap{ URL(string: $0.urlString) }
            .sink { [unowned self] url in
                let safari = SafariServices.SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        // Safari로 연결
        learnMoreButtonTapped.send(selectedFramework.value)
    }
}
