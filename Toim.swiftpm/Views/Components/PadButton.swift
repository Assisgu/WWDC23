//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 08/04/23.
//

import SwiftUI

struct PadButton: View {
    var color : Color
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(color)
    }
}

struct PadLight: View {
    var body: some View{
        PadButton(color: .white)
            .blur(radius: 70)
    }
}

struct PadButton_Previews: PreviewProvider {
    static var previews: some View {
        PadButton(color: .green)
    }
}
