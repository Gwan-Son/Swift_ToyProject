//
//  FrameWorkViewController.swift
//  AppleFramework
//
//  Created by 심관혁 on 2/26/24.
//

import UIKit
import Combine

class FrameWorkViewController: UIViewController {
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
        
        configureCollectionView()
        applySectionItems(dataList)
        bind()
    }
    
    private func bind() {
        // input: 사용자의 입력을 받아서, 처리해야할 것
        // item 선택 되었을 때 처리
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
            
            vc.selectedFramework.send(framework)
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
        
        frameworkCollectionView.collectionViewLayout = layout()
        frameworkCollectionView.delegate = self
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
    }
}
