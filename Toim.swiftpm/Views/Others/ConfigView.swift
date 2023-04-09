//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

struct ConfigView: View {
    var body: some View {
        VStack {
            Text("Screen config")
                .font(.system(size: 50))
            Image(systemName: "gear")
                .font(.system(size: 100))
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
