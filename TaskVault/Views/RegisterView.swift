//
//  RegisterView.swift
//  TaskVault
//
//  Created by Jayson Dasher on 6/11/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
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
                        Text("Register")
                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                            .bold()
                        
                        Text("Start Organizing Tasks")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    .background(Material.ultraThin)
                    .cornerRadius(10)
                    
                    Spacer()
                }
                

            }
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                
                TVButtonView(title: "Create Account", background: Color.green) {
                    // Attempt Login
                    viewModel.register()
                }
            }
            
//            .padding(.bottom, 100)
        
        }
//        .padding(.vertical)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
        Spacer()
        Spacer()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
