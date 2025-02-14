//
//  DetailViewController.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 13/02/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    let viewModel: UserViewModel
    var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.tableView.dataSource = self
        viewModel.onRepositoriesFetched = { [weak self] in
            self?.detailView.tableView.reloadData()
        }
        viewModel.fetchRepositories()
        
        configNavigation()
    }
    
    func configNavigation() {
        
        guard let user = viewModel.user, let imageUrl = URL(string: user.avatar_url) else { return }
        
        self.title = user.login
        
        URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.detailView.avatarImageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    setPlaceholderImage(for: self.detailView.avatarImageView)
                }
            }
        }.resume()
        
        func setPlaceholderImage(for imageView: UIImageView) {
            let placeholderImage = UIImage(systemName: "person.fill")
            detailView.avatarImageView.image = placeholderImage
        }
        
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.left.circle.fill"), style: .done, target: self, action: #selector(returnView))
        button.tintColor = .purple
        
        self.navigationItem.leftBarButtonItem = button
    }
    
    @objc func returnView() {
        self.navigationController?.popViewController(animated: true)
    }
}
