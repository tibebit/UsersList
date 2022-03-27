//
//  ContentView.swift
//  UsersList
//
//  Created by Fabio Tiberio on 14/03/22.
//

import SwiftUI
import Combine
import CoreData

struct ContentView: View {
    @State private var users = [User]()
    var api                  = UserAPI()
    @State private var isShowingError = false
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    userCards
                }
                .alert("Network Error", isPresented: $isShowingError, actions: {
                    Button("Ok", role: .cancel) {}
                })
                .padding(.vertical, 8)
            }
            .navigationTitle("Users List")
            .background(
                .linearGradient(Gradient(colors: [.blue, .purple]), startPoint: .topTrailing, endPoint: .bottom)
            )
        }
        .onAppear {
            let subscription = api.getUsers()
                .subscribe(on: DispatchQueue.global())
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    if case .failure(_) = completion {
                        isShowingError = true
                    }
                } receiveValue: { users in
                    self.users = users
                }
        }
    }
    
    var userCards: some View {
        ForEach(users) { user in
            NavigationLink {
                DetailView(user: user)
            } label: {
                HStack(alignment: .top) {
                    Label(user.name, systemImage: "person.circle.fill")
                        .font(.title3)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Age: \(user.age)")
                        Text(user.isActive ? "Active" : "Inactive")
                            .foregroundColor(user.isActive ? .green : .red)
                    }
                }
                .foregroundColor(.black)
                .padding(8)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .padding(.horizontal, 20)
                .shadow(radius: 5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
