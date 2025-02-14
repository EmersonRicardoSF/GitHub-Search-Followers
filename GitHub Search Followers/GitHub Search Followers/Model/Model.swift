//
//  Model.swift
//  GitHub Search Followers
//
//  Created by Emerson Ricardo Saia Filho on 13/02/25.
//

import Foundation
import UIKit

struct Repository: Codable {
    let name: String
    let language: String?
}

struct User: Codable {
    let login: String
    let avatar_url: String
}
