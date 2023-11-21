//
//  model.swift
//  Anime_MyApp
//
//  Created by Julian Thaler on 16/10/23.
//

import Foundation
import SwiftUI

struct Quote: Decodable, Identifiable {
    var id = UUID()
    let anime: String
    let character: String
    let quote: String
    
    
    private enum CodingKeys: String, CodingKey {
        case anime, character, quote
    }
    
    static var SampleQuotes: [Quote] = Bundle.main.decode(file: "quotes.json")
    //static var SampleQuotes2: [Quote] = Bundle.main.decode(file: "quotes2.json")
    static var SampleQuote = SampleQuotes.first!
    //static var SampleQuote2 = SampleQuotes2.first!
    
    // ADD 2nd json quotes, add toggle with refresh button
}
