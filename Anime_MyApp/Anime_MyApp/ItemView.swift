//
//  ItemView.swift
//  Anime_MyApp
//
//  Created by Julian Thaler on 16/10/23.
//

import SwiftUI

struct ItemView: View {
    
    let quote: Quote
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(quote.anime)
                    .font(.headline)
                Spacer()
            }
            Divider()
            Text(quote.quote)
                .font(.body)
            HStack {
                Spacer()
                Text("~ \(quote.character)")
                    .font(.footnote)
                            }
        }
    }
}

#Preview {
    ItemView(quote: Quote.SampleQuote)
}
