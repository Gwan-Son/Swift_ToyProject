//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine

class SearchViewController: UIViewController {
    
    let network = NetworkService(configuration: .default)
    
    @Published private(set) var users: [SearchResult] = []
    var subscription = Set<AnyCancellable>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = SearchResult
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedSearchControl()
        configureCollectionView()
        bind()
    }
    
    
    // searchController
    private func embedSearchControl() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.title = "Search"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Gwan-Son"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    // collectionView 구성
    private func configureCollectionView() {
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
                return nil
            }
            cell.user.text = itemIdentifier.login
            return cell
        })
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    // bind()
    private func bind() {
        $users
            .receive(on: RunLoop.main)
            .sink { users in
                var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
                snapshot.appendSections([.main])
                snapshot.appendItems(users, toSection: .main)
                self.datasource.apply(snapshot)
            }.store(in: &subscription)
    }
    // - 사용자 인터렉션 대응
    //   - 서치컨트롤에서 텍스트 -> 네트워크 요청
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("keyword: \(keyword)")
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
//        let base = "https://api.github.com/"
//        let path = "search/users"
//        let params: [String:String] = ["q":keyword]
//        let header: [String:String] = ["Content-Type":"application/json"]
//
//        var urlComponents = URLComponents(string: base + path)!
//        let queryItems = params.map { (key: String, value: String) in
//            return URLQueryItem(name: key, value: value)
//        }
//        urlComponents.queryItems = queryItems
//
//        var request = URLRequest(url: urlComponents.url!)
//        header.forEach { (key: String, value: String) in
//            request.addValue(value, forHTTPHeaderField: key)
//        }
        
        let resource = Resource<SearchUserResponse>(
            base: "https://api.github.com/",
            path: "search/users",params: ["q":keyword],
            header: ["Content-Type":"application/json"])
        
        network.load(resource)
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
            .store(in: &subscription)
//        URLSession.shared.dataTaskPublisher(for: request)
//            .map { $0.data }
//            .decode(type: SearchUserResponse.self, decoder: JSONDecoder())
//            .map { $0.items }
//            .replaceError(with: [])
//            .receive(on: RunLoop.main)
//            .assign(to: \.users, on: self)
//            .store(in: &subscription)
    }
}
