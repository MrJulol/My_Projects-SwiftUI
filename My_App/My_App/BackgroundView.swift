//
//  BackgroundView.swift
//  My_App
//
//  Created by Julian Thaler on 12/10/23.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    var State: Bool
    var body: some View {
            ContainerRelativeShape()
            .fill(State ? Color.blue.gradient : Color.black.gradient)
                .ignoresSafeArea()
        }
}
