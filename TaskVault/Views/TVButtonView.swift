//
//  TVButtonView.swift
//  TaskVault
//
//  Created by Jayson Dasher on 6/11/23.
//

import SwiftUI

struct TVButtonView: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Attempt Login
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TVButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TVButtonView(title: "Button", background: Color.blue) {
            // Action
        }
    }
}
