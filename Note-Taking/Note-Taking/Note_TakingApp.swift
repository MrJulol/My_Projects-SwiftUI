//
//  Note_TakingApp.swift
//  Note-Taking
//
//  Created by Julian Thaler on 29/02/24.
//

import SwiftUI

@main
struct Note_TakingApp: App {
    var testing = false
    var body: some Scene {
        WindowGroup {
            if(testing){
                TestingView()
            }else{
                ContentView()
            }
        }
    }
}
#Preview{
    ContentView()
}
