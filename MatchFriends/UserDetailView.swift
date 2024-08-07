//
//  UserDetailView.swift
//  MatchFriends
//
//  Created by Jesutofunmi Adewole on 07/08/2024.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: "https://picsum.photos/500/370")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 400, height: 290)
                    }
                    Text(user.email)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 10))
                }
                
                Text("Tags")
                    .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal).foregroundStyle(.gray)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.tags, id:\.self) { tag in
                            Text(tag)
                                .foregroundStyle(.white)
                                .padding(8)
                                .background(.teal)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .fixedSize()
                        }
                    }
                }
                
                Text("About")
                    .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.gray)
                    .padding()
                Text(user.about)
                    .padding(.horizontal)
                
                Text("Company")
                    .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.gray)
                    .padding()
                Text(user.company)
                    .padding(.horizontal)
                
                Text("Address")
                    .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.gray)
                    .padding()
                Text(user.address)
                    .padding(.horizontal)
                
                
                Text("Date Joined")
                    .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.gray)
                    .padding()
                Text("\(user.registered)")
                    .padding(.horizontal)
                
                Text("Friends")
                    .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding().foregroundStyle(.gray)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.friends, id:\.self) { friend in
                            Text(friend.name)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .fixedSize()
                        }
                    }
                }
            }
        }
        .navigationTitle(user.name)
    }
}

#Preview {
    UserDetailView(user: User(id: "djakda", isActive: true, name: "Adebowale Oyewale", age: 25, company: "Fertitude", email: "ade@fert.co", address: "Tinubuoye Street, Lokoja area, Lagos", about: "Just a friendly soul", registered: Date(), tags: ["friend", "hater", "for real"], friends: []))
}
