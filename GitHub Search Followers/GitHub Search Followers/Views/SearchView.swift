//
//  SearchView.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 13/02/25.
//

import UIKit

class SearchView: UIView {

    var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "github_search_followers_logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.leftViewMode = .always
        tf.autocorrectionType = .no
        
        tf.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray.withAlphaComponent(0.6)])
        tf.font = UIFont.boldSystemFont(ofSize: 16)
        
        tf.layer.cornerRadius = 6
        tf.layer.masksToBounds = false
        tf.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.5).cgColor
        tf.layer.borderWidth = 1.2
        tf.autocapitalizationType = .none
        tf.textColor = .black
        
        tf.backgroundColor = .systemGray.withAlphaComponent(0.06)
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        tf.leftView = leftPaddingView
        tf.leftViewMode = .always
        
        return tf
    }()
    
    var searchButton: UIButton = {
        let b = UIButton(type: .custom)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        b.tintColor = .white
        b.titleLabel?.font = .boldSystemFont(ofSize: 20)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .purple
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 12
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(logoImageView)
        addSubview(usernameTextField)
        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            
            searchButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 40),
            searchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
