//
//  OtherViews.swift
//  Note-Taking
//
//  Created by Julian Thaler on 29/02/24.
//

import SwiftUI

struct BackgroundView: View {
    
    var color : Color
    var isGradient : Bool

    var body: some View {
        
        if(isGradient){
            ContainerRelativeShape()
                .fill(color.gradient)
                .ignoresSafeArea()
        }else {
            ContainerRelativeShape()
                .fill(color)
                .ignoresSafeArea()
        }
        
        
    }
}
