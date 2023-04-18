//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 09/04/23.
//

import SwiftUI
import AVFoundation

struct PadsGame: View {
    
    @ObservedObject var padsViewModel: PadsClass = PadsClass.shared
    private let soundClass = SoundClass()

    var body: some View {
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                    .opacity(0.74)
                
                VStack(spacing: geometry.size.height * 0.03) {
                    Button {
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 1)
                            padsViewModel.soundClass.playSounds("do")
                            
                        }
                    } label: {
                        ZStack{
                            PadButton(color: .green)
                            if padsViewModel.lightGreen {
                                PadLight()
                            }
                        }
                    }
                    
                    Button {
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 2)
                            padsViewModel.soundClass.playSounds("re")
                        }
                    } label: {
                        ZStack{
                            PadButton(color: .yellow)
                            if padsViewModel.lightYellow{
                                PadLight()
                            }
                        }
                    }
                    
                    Button {
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 3)
                            padsViewModel.soundClass.playSounds("mi")
                        }
                    } label: {
                        ZStack{
                            PadButton(color: .red)
                            if padsViewModel.lightRed{
                                PadLight()
                            }
                        }
                    }
                    
                    Button {
                        if padsViewModel.playerCanplay {
                            padsViewModel.turnOnLight(color: 4)
                            padsViewModel.soundClass.playSounds("fa")
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

