//
//  FrameWorkViewController.swift
//  AppleFramework
//
//  Created by 심관혁 on 2/26/24.
//

import UIKit

class FrameWorkViewController: UIViewController {
//    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout를 import 했던 것
//    #1 기존 UICollectionVeiw 구현 코드
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataList.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameWorkCell", for: indexPath) as? FrameWorkCell else {
//            return UICollectionViewCell()
//        }
//        cell.configure(dataList[indexPath.item])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // 3줄
//        
//        let interItemSpacing: CGFloat = 10
//        let padding: CGFloat = 16
//        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
//        return CGSize(width: width, height: width * 1.5)
//         
//        // 2줄
//        /*
//         let interItemSpacing: CGFloat = 10
//         let padding: CGFloat = 16
//         let width = (collectionView.bounds.width - interItemSpacing - padding * 2) / 2
//         return CGSize(width: width, height: width * 1.5)
//         */
//        // 4줄
//        /*
//         let interItemSpacing: CGFloat = 10
//         let padding: CGFloat = 16
//         let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 4
//         return CGSize(width: width, height: width * 1.5)
//         */
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
    
    // #2 DiffableData
    // diffable datasource
    // - presentation
    // snapshot
    // - Data
    // compositional Layout
    // - layout

    
    @IBOutlet weak var frameworkCollectionView: UICollectionView!
    let dataList: [AppleFramework] = AppleFramework.list
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = AppleFramework // AppleFramework를 Item으로 타입 이름 변경 -> DiffableDateSource에서 Section과 Item으로 표시하기 위해서.
    enum Section {
        case main
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        #1 기존 UICollectionVeiw 구현 코드
//        frameworkCollectionView.dataSource = self
//        frameworkCollectionView.delegate = self
        
//        frameworkCollectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: frameworkCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameWorkCell", for: indexPath) as? FrameWorkCell else{
                return nil
            }
            cell.configure(itemIdentifier)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(dataList, toSection: .main)
        dataSource.apply(snapshot)
        
        frameworkCollectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.45))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}

extension FrameWorkViewController: UICollectionViewDelegate {
    // 셀이 클릭되었을 때
    func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        print("selected Item: \(dataList[indexPath.item].name)")
    }
}
