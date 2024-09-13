//
//  HomeViewController.swift
//  InstaSearchView
//
//  Created by 심관혁 on 2/27/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure("animal\(indexPath.item + 1)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width
        let height: CGFloat = width * 3 / 4 + 60
        return CGSize(width: width, height: height)
    }
    

    @IBOutlet weak var HomeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeCollectionView.dataSource = self
        HomeCollectionView.delegate = self
        
        if let flowLayout = HomeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
        
    }
}
