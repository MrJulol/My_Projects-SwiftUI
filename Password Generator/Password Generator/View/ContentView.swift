//
//  ContentView.swift
//  Password Generator
//
//  Created by Julian Thaler on 29/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Form {
            Section("Options"){
                Toggle("Symbol", isOn: $vm.containsSymbols)
                Toggle("Uppercase" , isOn: $vm.containsUppercase)
                Toggle("Numbers", isOn: $vm.containsNumbers)
                Stepper("Character count : \(vm.lenght)", value: $vm.lenght, in: 6...18)
                Button("Generate Password ", action: vm.createPassword)
                    .centerH()
            }
            Section("Passwords") {
                List(vm.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strenthColor)
                    }
                }
            }
        }
        .addNavigationView(title: "iPassword")
    }
}

#Preview {
    ContentView()
}
