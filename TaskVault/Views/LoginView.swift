//
//  LoginView.swift
//  TaskVault
//
//  Created by Jayson Dasher on 6/11/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                ZStack {
                    Image("sunsetmountain").resizable().ignoresSafeArea()
                        
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        VStack {
                            Text("Log In")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                                .bold()
                            
                            Text("Unlock Your Productivity Potential with TaskVault")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .background(Material.ultraThin)
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                    

                }
                // Login Form
                
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                    
                    TVButtonView(title: "Log In", background: Color.blue) {
                        // Attempt Login
                        viewModel.login()
                    }
                }
                
                
                // Create Account
                
                VStack {
                    Text("New Users")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom)
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
