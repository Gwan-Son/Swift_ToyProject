//
//  FrameWorkViewController.swift
//  AppleFramework
//
//  Created by 심관혁 on 2/26/24.
//

import UIKit
import Combine

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
    
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    @Published var dataList: [AppleFramework] = AppleFramework.list
    
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
        
        configureCollectionView()
        
        applySectionItems(dataList)
        
        bind()
        
        frameworkCollectionView.collectionViewLayout = layout()
        
        frameworkCollectionView.delegate = self
    }
    
    private func bind() {
        // input: 사용자의 입력을 받아서, 처리해야할 것
        // item 선택 되었을 때 처리
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
            vc.framework = framework
            self.present(vc, animated: true)
        }.store(in: &subscriptions)
        // output: data, state 변경에 따라서, UI 업데이트 할 것
        // item 세팅이 되었을 때 컬렉션뷰를 업데이트
        
        $dataList
            .receive(on: RunLoop.main)
            .sink { [unowned self] list in
            self.applySectionItems(list)
        }.store(in: &subscriptions)
    }
    
    private func applySectionItems(_ items: [Item], to sections: Section = .main) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([sections])
        snapshot.appendItems(items, toSection: sections)
        dataSource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: frameworkCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameWorkCell", for: indexPath) as? FrameWorkCell else{
                return nil
            }
            cell.configure(itemIdentifier)
            return cell
        })
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = dataList[indexPath.item]
        print("selected Item: \(dataList[indexPath.item].name)")
        didSelect.send(framework)
//        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
//        vc.framework = dataList[indexPath.item]
//        present(vc, animated: true)
    }
}
