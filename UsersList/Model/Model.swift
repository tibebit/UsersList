//
//  User.swift
//  UsersList
//
//  Created by Fabio Tiberio on 14/03/22.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    let age: Int
    let isActive: Bool
    
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    
    let friends: [Friend]
}

struct Friend: Codable {
    let id: UUID
    let name: String
}
