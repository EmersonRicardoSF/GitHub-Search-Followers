//
//  RepositoryCell.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 14/02/25.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    var repoTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .systemFont(ofSize: 16, weight: .bold)
        l.textColor = .black
        l.text = "Repository:"
        return l
    }()
    
    var repoNameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .systemFont(ofSize: 16, weight: .heavy)
        l.textColor = .black
        return l
    }()
    
    var languageTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .systemFont(ofSize: 12, weight: .bold)
        l.textColor = .black
        l.text = "Language:"
        return l
    }()
    
    var languageLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .systemFont(ofSize: 12, weight: .bold)
        l.textColor = .purple
        l.textAlignment = .left
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(repoTitleLabel)
        addSubview(repoNameLabel)
        addSubview(languageTitleLabel)
        addSubview(languageLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            repoTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repoTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            
            repoNameLabel.leadingAnchor.constraint(equalTo: repoTitleLabel.trailingAnchor, constant: 2),
            repoNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            
            languageTitleLabel.leadingAnchor.constraint(equalTo: repoTitleLabel.leadingAnchor),
            languageTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            
            languageLabel.leadingAnchor.constraint(equalTo: languageTitleLabel.trailingAnchor,constant: 2),
            languageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
    
    func configure(with repository: Repository, userImageURL: String?) {
        repoNameLabel.text = repository.name
        languageLabel.text = repository.language ?? "Unknown"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
