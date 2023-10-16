//
//  ContentViewModel.swift
//  Password Generator
//
//  Created by Julian Thaler on 29/09/23.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject{
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsNumbers = true
        @Published var containsUppercase = false
        @Published var lenght = 10
        
        init() {
            createPassword()
        }
        
        func createPassword(){
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet
            var newPassword = ""
            
            if containsSymbols{
                base += "!§$%&/()=?;:_*,.-"
            }
            if containsNumbers{
                base += "1234567890"
            }
            if containsUppercase{
                base += alphabet.uppercased()
            }
            
            for _ in 0..<lenght{
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            
            let password = Password(password: newPassword, containsSymbols:containsSymbols, containsNumbers:containsNumbers, containsUppercase:containsUppercase)
            
            withAnimation {
                passwords.insert(password, at: 0)
            }
        }
        
    }
}
