//
//  TextFieldView.swift
//  My_App
//
//  Created by Julian Thaler on 12/10/23.
//

import Foundation
import SwiftUI

class TextValidator: ObservableObject {

    @Published var text = ""

    func validate(_ value: String) -> String {
        value.replacingOccurrences(
                of: "\\W", with: "", options: .regularExpression
            )
    }
}


struct TextFieldView: View {

    @ObservedObject var textValidator = TextValidator()

    var body: some View {
        let validatingText = Binding<String>(
                get: { self.textValidator.text },
                set: { self.textValidator.text = self.textValidator.validate($0) }
                )
        return TextField("Type Here", text: validatingText)
            .padding(.horizontal, 20.0)
            .textFieldStyle(RoundedBorderTextFieldStyle())

    }
}
