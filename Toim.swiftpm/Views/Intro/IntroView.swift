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
    private var textOnly = TextOnly()
    private var textIntro : [String]
    
    init(){
        self.textIntro = textOnly.textIntr
    }
    
    var body: some View {
        
            GeometryReader { geometry in
                ZStack{
//                    Color(red: 89/255, green: 111/255, blue: 130/255)
                    Color(uiColor: UIColor(red: 0.164, green: 0.233, blue: 0.292, alpha: 1))
                    
                    Image("bg")
                        .opacity(0.8)
                }
                
                VStack(spacing: 0) {
                    HStack {
                        Text("\(textIntro[index])")
                            .font(.system(.largeTitle) .weight(.light))
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
                                    index -= 1
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
                                    index += 1
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

//struct IntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroView()
//    }
//}
