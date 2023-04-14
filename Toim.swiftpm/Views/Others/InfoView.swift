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
                HStack {
                    ZStack {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: geometry.size.width * 0.3)
                        
                        VideoPlayer(player: player)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                            .frame(width: geometry.size.width * 0.28)
                    }
                                            
                }
                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.22)
                .padding(.top)
//                .cornerRadius(360)
                
                Text("About me")
                    .font(.system(.title) .weight(.bold))
                ScrollView {
                    Text("""
                         Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet turpis eu mi lobortis ultricies ac molestie mauris. Sed a iaculis enim. Fusce magna nibh, vulputate sit amet justo eu, iaculis malesuada nisl. Integer lacinia tristique nisi sed cursus. Sed nulla risus, tempus id ultrices at, gravida at quam. Maecenas sed malesuada leo. Integer sed arcu non lorem pellentesque ullamcorper quis quis dui. Sed vestibulum aliquet tristique. Integer nec nulla ultrices, fermentum mi ut, posuere neque. Fusce gravida blandit tortor vitae mattis.
                """)
                    .font(.system(.headline))
                   
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
                
                Text("About project")
                    .font(.system(.title) .weight(.bold))
                ScrollView{
                    Text(
                    """
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet turpis eu mi lobortis ultricies ac molestie mauris. Sed a iaculis enim. Fusce magna nibh, vulputate sit amet justo eu, iaculis malesuada nisl. Integer lacinia tristique nisi sed cursus. Sed nulla risus, tempus id ultrices at, gravida at quam. Maecenas sed malesuada leo. Integer sed arcu non lorem pellentesque ullamcorper quis quis dui. Sed vestibulum aliquet tristique. Integer nec nulla ultrices, fermentum mi ut, posuere neque. Fusce gravida blandit tortor vitae mattis.
                    """)
                    .font(.system(.headline))
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                
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
