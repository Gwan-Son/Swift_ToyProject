//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by 심관혁 on 2/28/24.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var extendButton: UIButton!
    
    var presentated: Bool = false
    
    var focusList: [Focus] = Focus.list
    
    enum Section {
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Focus>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        extendButton.layer.cornerRadius = 10
        
        datasource = UICollectionViewDiffableDataSource<Section,Focus>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            
            cell.configure(itemIdentifier)
            
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Focus>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
        collectionView.delegate = self
        
        updateButtonTitle()
    }
    
    private func layout() -> UICollectionViewLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func updateButtonTitle(){
        let title = presentated ? "See All":"See Recommendation"
        extendButton.setTitle(title, for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        presentated.toggle()
        self.focusList = presentated ? Focus.recommendations : Focus.list
        var snapshot = NSDiffableDataSourceSnapshot<Section, Focus>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        datasource.apply(snapshot)
        
        updateButtonTitle()
    }
}

extension FocusViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = focusList[indexPath.item]
        
        let storyboard = UIStoryboard(name: "QuickFocus", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuickFocusListViewController") as! QuickFocusListViewController
        
        present(vc, animated: true)
    }
}
