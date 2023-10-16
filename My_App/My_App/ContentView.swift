//
//  ContentView.swift
//  My_App
//
//  Created by Julian Thaler on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedOn: Bool = false
    
    var body: some View{
        ZStack{
            BackgroundView(State: isLoggedOn)
            if(isLoggedOn){
                LoggedOnView(isLoggedOn: $isLoggedOn)
            }
            else{
                LoggedOffView(isLoggedOn: $isLoggedOn)
            }
        }
    }
}

#Preview {
    ContentView()
}

