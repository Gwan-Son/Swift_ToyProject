//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by 심관혁 on 2/27/24.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as? OnboardingCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.configure(onboardingMessageList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / self.collectionView.bounds.width
        self.pagecontrol.currentPage = Int(page)
    }
    
    let onboardingMessageList: [OnboardingMessage] = OnboardingMessage.messages
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        pagecontrol.numberOfPages = onboardingMessageList.count
        
    }
}
