//
//  DetailTableViewExtension.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 14/02/25.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as? RepositoryCell else {
            return UITableViewCell()
        }
        let repo = viewModel.repositories[indexPath.row]
        cell.configure(with: repo, userImageURL: viewModel.user?.avatar_url)
        return cell
    }
}

