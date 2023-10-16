//
//  ViewModifiers.swift
//  Password Generator
//
//  Created by Julian Thaler on 29/09/23.
//

import Foundation
import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    func addNavigationView(title: String) -> some View {
        NavigationView {
            self.navigationTitle(title)
        }
    }
}
