//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by 심관혁 on 3/5/24.
//

import UIKit
import SafariServices

class FrameworkDetailViewController: UIViewController {

    var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    @IBOutlet weak var frameworkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    func updateUI() {
        frameworkImage.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    }
    @IBAction func buttonTapped(_ sender: Any) {
        // Safari로 연결
        guard let url = URL(string: framework.urlString) else {
            return
        }
        
        let safari = SafariServices.SFSafariViewController(url: url)
        present(safari, animated: true)
    }
}
