//
//  UserAPI.swift
//  UsersList
//
//  Created by Fabio Tiberio on 14/03/22.
//

import Foundation
import Combine

class UserAPI {
    private var decoder = JSONDecoder()
    private var url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
    
    func getUsers() -> AnyPublisher<[User], Error> {
        decoder.dateDecodingStrategy = .iso8601
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
