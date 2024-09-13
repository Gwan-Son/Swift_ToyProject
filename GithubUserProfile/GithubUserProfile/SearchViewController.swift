//
//  SearchViewController.swift
//  GithubUserSearch
//
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
//    let network = NetworkService(configuration: .default)
    
//    @Published private(set) var user: UserProfile?
    var subscription = Set<AnyCancellable>()
    
    var viewModel: SearchViewModel!
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(network: NetworkService(configuration: .default), selectedUser: nil)
        setupUI()
        embedSearchControl()
        bind()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Gwan-Son"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func bind() {
        viewModel.selectedUser
            .receive(on: RunLoop.main)
            .sink { [unowned self] _ in
                self.nameLabel.text = self.viewModel.name
                self.loginLabel.text = self.viewModel.login
                self.followerLabel.text = self.viewModel.followers
                self.followingLabel.text = self.viewModel.following
                
                self.thumbnail.kf.setImage(with: self.viewModel.imageURL)
            }.store(in: &subscription)
    }
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        viewModel.search(keyword: keyword)
    }
}
