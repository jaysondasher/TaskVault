//
//  LoginViewModel.swift
//  TaskVault
//
//  Created by Jayson Dasher on 6/11/23.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else {
            errorMessage = "Please enter a valid email."
            return false
        }
        return true
    }
    
}
