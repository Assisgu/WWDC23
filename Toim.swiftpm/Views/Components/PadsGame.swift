//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 09/04/23.
//

import SwiftUI

struct PadsGame: View {
    
   @ObservedObject var padsViewModel = PadsClass()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                    .opacity(0.74)
                    .frame(height: geometry.size.height * 0.9)
                
                VStack(spacing: geometry.size.height * 0.03) {
                    //Green
                    Button {
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 1)
                        }
                    } label: {
                        ZStack{
                            PadButton(color: .green)
                            if padsViewModel.lightGreen {
                                PadLight()
                            }
                        }
                    }
                    
                    //Yellow
                    Button {
                        padsViewModel.turnOnLight(color: 2)
                        padsViewModel.playerCanplay.toggle()
                        print(padsViewModel.playerCanplay)
                        
                    } label: {
                        ZStack{
                            PadButton(color: .yellow)
                            if padsViewModel.lightYellow{
                                PadLight()
                            }
                        }
                    }
                    
                    //Red
                    Button {
                        padsViewModel.turnOnLight(color: 3)
                    } label: {
                        ZStack{
                            PadButton(color: .red)
                            if padsViewModel.lightRed{
                                PadLight()
                            }
                        }
                    }
                    
                    //Blue
                    Button {
                        padsViewModel.turnOnLight(color: 4)
                    } label: {
                        ZStack{
                            PadButton(color: .blue)
                            if padsViewModel.lightBlue{
                                PadLight()
                            }
                        }
                    }
                }
                .buttonStyle(NoAnim())
                .padding()
                .frame(height: geometry.size.height * 0.9)
            
                
//                VStack{
//                    padsViewModel.playerCanplay ?  Text("Pode jogar") : Text ("Memorize sequence")
//
//                } .frame(height: geometry.size.height, alignment: .bottom)
//                    .font(.system(.title).weight(.medium))
//                    .padding()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
           
        }
        
    }
}

struct MessageView: View {
    
    private var padGameView = PadsGame()
    
    @ObservedObject var messageViewModel = PadsClass()
    var body: some View {
        VStack{
            if padGameView.padsViewModel.playerCanplay {
                Text("Verdade")
            } else {
                Text("Mentira")
            }
        }
    }
}



struct NoAnim: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}

struct PadsGame_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            VStack{
                PadsGame()
                    .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.75)
                MessageView()
                
                
            } .frame(width: geometry.size.width, height: geometry.size.height, alignment:  .center)
            

        }
    }
}
