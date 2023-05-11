//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 08/04/23.
//

import SwiftUI


// MARK: - ShapeButton
/* Create the button shape */
struct PadButton: View {
    var color : Color
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(color)
    }
}

// MARK: - Button Light
/* Create light effect on button */
struct PadLight: View {
    var body: some View{
        PadButton(color: .white)
            .blur(radius: 70)
    }
}

