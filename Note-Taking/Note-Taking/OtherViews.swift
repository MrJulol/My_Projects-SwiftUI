//
//  OtherViews.swift
//  Note-Taking
//
//  Created by Julian Thaler on 29/02/24.
//

import SwiftUI

struct BackgroundView: View {
    
    var color : Color

    var body: some View {
        ContainerRelativeShape()
            .fill(color.gradient)
            .ignoresSafeArea()
    }
}
