//
//  PasswordModel.swift
//  Password Generator
//
//  Created by Julian Thaler on 29/09/23.
//

import Foundation
import SwiftUI


struct Password: Identifiable, Codable{
    var id = UUID()
    var password: String
    var containsSymbols: Bool
    var containsNumbers: Bool
    var containsUppercase: Bool
    
    var strenthColor: Color{
        var strenght = 0
        var color: Color
        
        if containsSymbols{
            strenght += 1
        }
        if containsNumbers{
            strenght += 1
        }
        if containsUppercase{
            strenght += 1
        }
        if password.count > 12 {
            strenght+=1
        }
        else if password.count < 8{
            strenght-=1
        }
        
        switch strenght{
        case -1: color = .gray
        case 1: color = .yellow
        case 2: color = .orange
        case 3: color = .red
        case 4: color = .purple
        default: color = .green
        }
        
        return color
    }
    
}
