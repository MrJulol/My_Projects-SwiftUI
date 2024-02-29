//
//  Note.swift
//  Note-Taking
//
//  Created by Julian Thaler on 29/02/24.
//

import Foundation

    let dateFormatter = DateFormatter()

    struct NoteItem: Codable, Hashable, Identifiable {
        let id: Int
        let text: String
        var date = Date()
        var dateText: String {
            dateFormatter.dateFormat = "MMM d yyyy, h:mm a"
            return dateFormatter.string(from: date)
        }
}
