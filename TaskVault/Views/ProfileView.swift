//
//  ProfileView.swift
//  TaskVault
//
//  Created by Jayson Dasher on 6/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//                if let user = viewModel.user {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    ProgressView()
                        .padding()
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            .padding(.top, 40)
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        // Info: Name, Email, Member Since
        VStack(alignment: .center) {
            HStack {
                Text(user.name)
                
            }
            .padding(1)
            HStack {
                Text(user.email)
                
            }
            .padding(1)
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(1)
        }
        
        // Sign out button
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(Color.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
