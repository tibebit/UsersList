//
//  DetailView.swift
//  UsersList
//
//  Created by Fabio Tiberio on 14/03/22.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    personalData
                    
                    account
                    
                    friends
                    
                    tags
                }
            }
            .background(
                .linearGradient(Gradient(colors: [.blue, .purple]), startPoint: .topTrailing, endPoint: .bottom)
            )
            .navigationTitle("User Info")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var personalData: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Personal")
                .font(.title.bold())
                .foregroundColor(.white)
                .shadow(radius: 3)
            RoundedRectangle(cornerRadius: 14)
                .frame(maxWidth: .infinity, maxHeight: 4)
            HStack {
                Text(user.name)
                    .font(.title3.bold())
                .foregroundColor(.primary)
                Spacer()
                Text("\(user.age) years old")
                    .foregroundColor(.secondary)
                    .padding(4)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
            }
            
            Text(user.address)
                .padding([.top], 16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.horizontal, 16)
    }
    
    var account: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Account")
                .font(.title.bold())
                .foregroundColor(.white)
                .shadow(radius: 3)
            RoundedRectangle(cornerRadius: 14)
                .frame(maxWidth: .infinity, maxHeight: 4)
            HStack {
                Text(user.isActive ? "Active" : "Inactive")
                    .font(.title3.bold())
                    .padding(8)
                    .background(.thinMaterial)
                .clipShape(Capsule())
                VStack {
                    Text(user.email)
                    Text(user.registered.formatted(date: .abbreviated, time: .omitted))
                }
            }
                
            Text(user.about)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.horizontal, 16)
    }
    
    
    var friends: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Friends")
                .font(.title.bold())
                .foregroundColor(.white)
                .shadow(radius: 3)
            RoundedRectangle(cornerRadius: 14)
                .frame(maxWidth: .infinity, maxHeight: 4)
            
            ForEach(user.friends) { friend in
                Text(friend.name)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.horizontal, 16)
    }
    
    
    var tags: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Tags")
                .font(.title.bold())
                .foregroundColor(.white)
                .shadow(radius: 3)
            RoundedRectangle(cornerRadius: 14)
                .frame(maxWidth: .infinity, maxHeight: 4)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag.uppercased())
                            .font(.footnote)
                            .foregroundColor(.primary)
                            .padding(8)
                            .background(
                                Capsule(style: .continuous)
                                    .foregroundStyle(.purple.opacity(0.3))
                                    .overlay(
                                        Capsule(style: .continuous)
                                            .strokeBorder(lineWidth: 0.5)
                                            .foregroundStyle(.secondary)
                                    )
                            )
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.horizontal, 16)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.example)
    }
}
