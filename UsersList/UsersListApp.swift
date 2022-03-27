//
//  UsersListApp.swift
//  UsersList
//
//  Created by Fabio Tiberio on 14/03/22.
//

import SwiftUI

@main
struct UsersListApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
