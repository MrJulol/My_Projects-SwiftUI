//
//  LoggedOffView.swift
//  My_App
//
//  Created by Julian Thaler on 12/10/23.
//

import SwiftUI

struct LoggedOffView: View {
    @Binding var isLoggedOn: Bool
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "tray.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("Not Logged On")
            }
            TextFieldView()
            Button {
                isLoggedOn.toggle()
            } label: {
                LoginButtonView(title: "Log On",
                              textColor: .black,
                              backgroundColor: .orange)
            }
            
            
            
        }
    }
}
