//
//  UserViewModel.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 13/02/25.
//

import UIKit
import Foundation

class UserViewModel {
    var user: User?
    var repositories: [Repository] = []
    var onUserFetched: (() -> Void)?
    var onRepositoriesFetched: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchUser(username: String) {
        let urlString = "https://api.github.com/users/\(username)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let _ = error {
                    self.onError?("A network error has occurred. Check your Internet connection and try again later.")
                    return
                }
                
                guard let data = data, let user = try? JSONDecoder().decode(User.self, from: data) else {
                    self.onError?("User not found. Please enter another name.")
                    return
                }
                
                self.user = user
                self.onUserFetched?()
            }
        }.resume()
    }
    
    func fetchRepositories() {
        guard let user = user else { return }
        let urlString = "https://api.github.com/users/\(user.login)/repos"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let _ = error {
                    self.onError?("A network error has occurred. Check your Internet connection.")
                    return
                }
                
                guard let data = data, let repos = try? JSONDecoder().decode([Repository].self, from: data) else {
                    self.onError?("Error loading repositories.")
                    return
                }
                
                self.repositories = repos
                self.onRepositoriesFetched?()
            }
        }.resume()
    }
}

