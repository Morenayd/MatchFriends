//
//  UserView.swift
//  MatchFriends
//
//  Created by Jesutofunmi Adewole on 07/08/2024.
//

import SwiftData
import SwiftUI

struct UserView: View {
    @Binding var users: [User]
    
    var body: some View {
        
        Section {
            List {
                LazyVStack {
                    ForEach(users, id:\.self) { user in
                        NavigationLink(value: user, label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(user.name)
                                    HStack {
                                        Text("\(user.age) years")
                                            .font(.headline).fontWeight(.ultraLight)
                                        Text("\(user.friends.count) friends")
                                            .font(.headline).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).fontWeight(.light)
                                    }
                                }
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor( user.isActive ? .green : .yellow)
                            }
                        })
                    }
                }
            }
        }
        .navigationTitle("Users")
        .navigationDestination(for: User.self) { user in
            UserDetailView(user: user)
        }

    }
    
}

#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: User.self, configurations: config)
        @State var exampleUsers = [
            User(id: "djakda", isActive: true, name: "Adebowale Oyewale", age: 25, company: "Fertitude", email: "ade@fert.co", address: "Tinubuoye Street, Lokoja area, Lagos", about: "Just a friendly soul", registered: Date(), tags: ["friend"], friends: []),
            User(id: "edafafd", isActive: false, name: "Tolulope Oga", age: 25, company: "Fertitude", email: "ade@fert.co", address: "Tinubuoye Street, Lokoja area, Lagos", about: "Just a friendly soul", registered: Date(), tags: ["friend"], friends: [])
        ]
        return UserView(users: $exampleUsers)
//        .modelContainer(container)
//    } catch {
//        return Text("Failed to create preview: \(error.localizedDescription)")
//    }
}
