//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by 심관혁 on 2/28/24.
//

import UIKit

// https://developer.spotify.com/documentation/general/design-and-branding/#using-our-logo
// https://developer.apple.com/documentation/uikit/nscollectionlayoutsectionvisibleitemsinvalidationhandler
// 과제: 아래 애플 샘플 코드 다운받아서 돌려보기  https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views

class PaywallViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerList: [BannerInfo] = BannerInfo.list
    
    enum Section {
        case main
    }
    
    
    var datasource: UICollectionViewDiffableDataSource<Section, BannerInfo>!
    
     override func viewDidLoad() {
        super.viewDidLoad()
    }
}
