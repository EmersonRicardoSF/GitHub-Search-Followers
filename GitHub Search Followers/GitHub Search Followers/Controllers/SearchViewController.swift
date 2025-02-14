//
//  ViewController.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 13/02/25.
//

import UIKit

class SearchViewController: UIViewController {

    var searchView: SearchView?
    
    let userViewModel = UserViewModel()
    
    override func loadView() {
        searchView = SearchView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView?.searchButton.addTarget(self, action: #selector(searchUser), for: .touchUpInside)
        searchView?.usernameTextField.delegate = self
        
        configNavigation()
    }
    
    func configNavigation() {
        self.title = "SEARCH"
    }
    
    @objc func searchUser() {
        guard let username = searchView?.usernameTextField.text, !username.isEmpty else { return }
        userViewModel.fetchUser(username: username)
        userViewModel.onUserFetched = {
            let detailVC = DetailViewController(viewModel: self.userViewModel)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        userViewModel.onError = { message in self.showAlert(message: message) }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
