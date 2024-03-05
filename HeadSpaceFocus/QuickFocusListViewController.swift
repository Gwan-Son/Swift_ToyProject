//
//  QuickFocusListViewController.swift
//  HeadSpaceFocus
//
//  Created by 심관혁 on 3/5/24.
//

import UIKit

class QuickFocusListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let breathingList : [QuickFocus] = QuickFocus.breathing
    let walkingList : [QuickFocus] = QuickFocus.walking
    
    enum Section: CaseIterable {
        case breathe
        case walking
        
        var title: String {
            switch self {
            case .breathe: return "Breathing exercises"
            case .walking: return "Mindful walks"
            }
        }
    }
    
    typealias Item = QuickFocus
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else {
                return nil
            }
            cell.configure(itemIdentifier)
            return cell
        })
        
        datasource.supplementaryViewProvider = { (collectionView, kind, IndexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "QuickFocusHeaderView", for: IndexPath) as? QuickFocusHeaderView else{
                return nil
            }
            let allSections = Section.allCases
            
            header.configure(allSections[IndexPath.section].title)
            
            return header
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(breathingList, toSection: .breathe)
        snapshot.appendItems(walkingList, toSection: .walking)
        
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
        
    }
    private func layout() -> UICollectionViewCompositionalLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20)
        
        section.interGroupSpacing = 20
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}
