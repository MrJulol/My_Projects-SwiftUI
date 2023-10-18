//
//  ViewModel.swift
//  Anime_MyApp
//
//  Created by Julian Thaler on 16/10/23.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var quotes = [Quote]()
    
    private let baseURL = "https://animechan.xyz/api/quotes"
    private let apiManager = ApiManager()
    
    init(testMode: Bool) {
        testMode ? makeFakeApiRequest() : makeApiRequest()
    }
    
    func makeApiRequest() {
        apiManager.getData(url: baseURL, model: [Quote].self) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch(result) {
                case .success(let quotes):
                    self.quotes = quotes
                case .failure(let error):
                    let errorQuote = Quote(anime: "Error", character: "Error", quote: error.localizedDescription)
                    self.quotes = [errorQuote]
                    print(error)
                }
            }
        }
    }
    
    func makeFakeApiRequest() {
        self.quotes = Quote.SampleQuotes
    }
}
