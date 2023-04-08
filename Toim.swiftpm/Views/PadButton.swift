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
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(color)
//                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.5)
            
        }
        
        
    }
}

struct PadButton_Previews: PreviewProvider {
    static var previews: some View {
        PadButton(color: .green)
    }
}
