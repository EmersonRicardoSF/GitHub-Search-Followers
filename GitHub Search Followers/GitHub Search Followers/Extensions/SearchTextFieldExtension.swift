//
//  SearchTextFieldExtension.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 13/02/25.
//

import Foundation
import UIKit

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 3
        
        switch textField {
            
        case searchView?.usernameTextField:
            textField.layer.borderColor = UIColor.purple.cgColor
            
        default:
            print("None")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("OK")
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
