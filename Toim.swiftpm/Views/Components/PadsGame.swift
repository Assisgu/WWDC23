//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 09/04/23.
//

import SwiftUI

struct PadsGame: View {
    
    @ObservedObject var padsViewModel: PadsClass = PadsClass.shared
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                    .opacity(0.74)
                
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
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 2)
                        }
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
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 3)
                        }
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
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 4)
                        }
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
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
           
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
                
                
            } .frame(width: geometry.size.width, height: geometry.size.height, alignment:  .center)
            

        }
    }
}
