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
    @State var prepared: Bool = false
    private var textOnly = TextClass()
    private var textIntro : [String]
    
    init(){
        self.textIntro = textOnly.intro
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                Color(uiColor: UIColor(red: 0.164, green: 0.233, blue: 0.292, alpha: 1))
                
                VStack{
                    Image("bg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.8)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
            
            VStack(spacing: 0) {
                HStack {
                    ZStack {
                        Color(.gray)
                            .cornerRadius(30)
                        Text("\(textIntro[index])")
                            .font(.system(.largeTitle) .weight(.light))
                            .multilineTextAlignment(.center)
                            .transition(.asymmetric(insertion: .scale, removal: .slide))
                            .padding()
                    }
                    .frame(height: geometry.size.height * 0.12)
                    
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                
                HStack {
                    Image("toim-intro")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.height * 0.55)
                }
                .frame(height: geometry.size.height * 0.6)
                
                HStack{
                    if index >= 1 {
                        Button {
                            if index > 0 {
                                withAnimation(.linear(duration: 0.4)){
                                    index -= 1
                                }
                                prepared = false
                            }
                        } label: {
                            HStack{
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            .font(.system(.title).weight(.light))
                        }
                    }
                    Spacer()
                    if !prepared {
                        Button {
                            if index < textIntro.count - 1 {
                                withAnimation(.linear(duration: 0.4)){
                                    index += 1
                                }
                            } else {
                                prepared = true
                            }
                        } label: {
                            HStack{
                                Text("Next")
                                Image(systemName: "chevron.right")
                            }
                            .font(.system(.title).weight(.light))
                            //
                        }
                    } else {
                        NavigationLink(destination: HomeView()) {
                            HStack{
                                Text("Lets go")
                                Image(systemName: "chevron.right.2")
                            }
                            .font(.system(.title).weight(.light))
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.1)
                .padding(.horizontal, geometry.size.width * 0.1)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .foregroundColor(.white)
            
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

