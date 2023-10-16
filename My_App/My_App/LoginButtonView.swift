//
//  LoginButtonView.swift
//  My_App
//
//  Created by Julian Thaler on 12/10/23.
//

import SwiftUI

struct LoginButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    
    }
}
