//
//  LoggedOnView.swift
//  My_App
//
//  Created by Julian Thaler on 12/10/23.
//

import SwiftUI

struct LoggedOnView: View {
    @Binding var isLoggedOn: Bool
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "person.badge.shield.checkmark")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("User: Julian")
            }
            Button {
                isLoggedOn.toggle()
            } label: {
                LoginButtonView(title: "Log Off",
                              textColor: .red,
                              backgroundColor: .gray)
            }
            
            
            
        }
    }
}
