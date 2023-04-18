//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI
import AVKit

struct InfoView: View {
    let player: AVPlayer
    private var textClass = TextClass()
//    private var textIntro : [String]
    
    init(videoName: String) {
        player = loopVideo(named: "memoji")
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(uiColor: UIColor(red: 0.164, green: 0.233, blue: 0.292, alpha: 1))
            }
            .ignoresSafeArea()
            VStack{
    
                    ZStack {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: geometry.size.width * 0.29)
                        
                        VideoPlayer(player: player)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                            .frame(width: geometry.size.width * 0.28)
                    }
                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.22)
                .padding(.vertical)

                
                Text("About me")
                    .font(.system(.title) .weight(.bold))
                    .padding(.top)
                ScrollView {
                    Text("\(textClass.aboutMe)")
                    .font(.system(.headline))
//                    .multilineTextAlignment(.center)
                    
                   
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.5)
                
                
                Text("© by: Gustavo Assis 2023")
                    .frame(alignment: .bottom)
                
            }
            .padding(.bottom)
            .foregroundColor(.white)
            .frame(width: geometry.size.width, alignment: .center)
           
        }
    }
}

//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView()
//    }
//}
