//
//  ContentView.swift
//  MatchFriends
//
//  Created by Jesutofunmi Adewole on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            UserView(users: $users)
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
                users = try await getUsers()
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
    ContentView()
}
