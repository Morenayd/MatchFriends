//
//  ContentView.swift
//  MatchFriends
//
//  Created by Jesutofunmi Adewole on 07/08/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            UserView(users: users)
                .navigationTitle("MatchFriends")
        }
        .onAppear {
            Task {
                await loadUsers()
            }
        }
    }
    
    func loadUsers() async {
        if (users.isEmpty) {
            do {
                let fetchedUsers = try await getUsers()
                for user in fetchedUsers {
                    modelContext.insert(user)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getUsers() async throws -> [User] {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"        
        let (data, _) = try await URLSession.shared.data(for: request)
 
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decodedData = try decoder.decode([User].self, from: data)
        print(decodedData)
        return decodedData
    }
}

#Preview {
    do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: User.self, configurations: config)
            return ContentView()
                .modelContainer(container)
        } catch {
            return Text("Failed to create preview: \(error.localizedDescription)")
        }
}
