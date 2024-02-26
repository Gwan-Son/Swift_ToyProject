//
//  FrameWorkViewController.swift
//  AppleFramework
//
//  Created by 심관혁 on 2/26/24.
//

import UIKit

class FrameWorkViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameWorkCell", for: indexPath) as? FrameWorkCell else {
            return UICollectionViewCell()
        }
        cell.configure(dataList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    

    
    @IBOutlet weak var frameworkCollectionView: UICollectionView!
    let dataList: [AppleFramework] = AppleFramework.list
    override func viewDidLoad() {
        super.viewDidLoad()
        frameworkCollectionView.dataSource = self
        frameworkCollectionView.delegate = self
    }
    
    

}
