//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

struct IntroView: View {
    @State private var index: Int = 0
    @State var start: Bool = false
    private var textOnly = TextOnly()
    private var textIntro : [String]
    
    
    init(){
        self.textIntro = textOnly.textIntr
    }
    
    var body: some View {
        
            GeometryReader { geometry in
                ZStack{
                    Color(red: 89/255, green: 111/255, blue: 130/255)
                }
                
                VStack(spacing: 0) {
                    HStack {
                        Text("\(textIntro[index])")
                            .font(.system(.largeTitle, design: .rounded) .weight(.semibold))
                    }
                    .frame(height: geometry.size.height * 0.3)
                    
                    HStack {
                        Image("toim-intro")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.height * 0.55)
                    }
                    .frame(height: geometry.size.height * 0.6)
                    
                    HStack{
                        !start ? Text("Tap to continue") : Text("Play")
                        
                        NavigationLink(destination: HomeView()) {
                            Text ("Clica aqui ")
                        }

                    }
                    .frame(height: geometry.size.height * 0.1)
                    .padding(.bottom)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .foregroundColor(.white)
                .onTapGesture {
                    if index < textIntro.count - 1 {
                        index += 1
                    } else {
                        index = 0
                        start = true
                    }
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
       
    }
}

//struct IntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroView()
//    }
//}
