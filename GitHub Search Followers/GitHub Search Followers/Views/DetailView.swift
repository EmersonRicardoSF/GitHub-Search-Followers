//
//  DetailView.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 14/02/25.
//

import UIKit

class DetailView: UIView {
    
    var avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 100
        iv.clipsToBounds = true
        
        return iv
    }()
    
    var shadowView: UIView = {
        let sv = UIView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.layer.shadowColor = UIColor.black.cgColor
        sv.layer.shadowOpacity = 0.5
        sv.layer.shadowOffset = CGSize(width: 0, height: 4)
        sv.layer.shadowRadius = 5
        sv.layer.masksToBounds = false
        
        return sv
    }()
    
    var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(RepositoryCell.self, forCellReuseIdentifier: "RepoCell")
        
        return tv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(shadowView)
        shadowView.addSubview(avatarImageView)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            shadowView.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            shadowView.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            shadowView.widthAnchor.constraint(equalToConstant: 220),
            shadowView.heightAnchor.constraint(equalToConstant: 220),
            
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 200),
            avatarImageView.heightAnchor.constraint(equalToConstant: 200),
            
            tableView.topAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 2),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
