//
//  ContentView.swift
//  Anime_MyApp
//
//  Created by Julian Thaler on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel(testMode: true)
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
            .fill(Color.black.gradient)
                .ignoresSafeArea()
            List {
                ForEach(vm.quotes) { quote in
                    ItemView(quote: quote)
                        .padding(4)
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("AnimeQuotes")
            .refreshable {
                vm.makeApiRequest()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
