//
//  DataController.swift
//  UsersList
//
//  Created by Fabio Tiberio on 25/03/22.
//

import Combine
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "UsersList")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                // handle the error
            }
        }
    }
}
