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
    
    static let example = User(id: UUID(), name: "John Lee", age: 20, isActive: true, company: "Microsoft", email: "john.legend@domain.com", address: "555, Awesome Street", about: "I'm passionate about development and fishing. During my free time I like to code APIs to power my side projects", registered: Date.now, tags: ["life-long learner", "engineer", "gamer", ], friends: [Friend(id: UUID(), name: "Lee Yu"), Friend(id: UUID(), name: "Michael Pearson"), Friend(id: UUID(), name: "Timothy Smith")])
}

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}
