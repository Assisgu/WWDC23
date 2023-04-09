//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(.systemCyan)
            }
            .ignoresSafeArea()
            VStack{
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: geometry.size.width * 0.2))
                }
                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.25)
                .padding()
                Text("About me")
                    .font(.system(.title) .weight(.bold))
                ScrollView {
                    Text("""
                         Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet turpis eu mi lobortis ultricies ac molestie mauris. Sed a iaculis enim. Fusce magna nibh, vulputate sit amet justo eu, iaculis malesuada nisl. Integer lacinia tristique nisi sed cursus. Sed nulla risus, tempus id ultrices at, gravida at quam. Maecenas sed malesuada leo. Integer sed arcu non lorem pellentesque ullamcorper quis quis dui. Sed vestibulum aliquet tristique. Integer nec nulla ultrices, fermentum mi ut, posuere neque. Fusce gravida blandit tortor vitae mattis.
                         
                         Sed interdum non dui in blandit. Pellentesque a ex a lectus tincidunt malesuada. Ut a tortor sit amet ante volutpat iaculis nec ut diam. Curabitur urna mauris, commodo eget augue non, sollicitudin tincidunt enim. Phasellus aliquam orci sed urna vehicula maximus. Suspendisse potenti. Fusce ex erat, porttitor sed tempus sit amet, ornare ut enim. Duis pulvinar augue id tincidunt maximus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse in vehicula tortor, a cursus purus. Pellentesque nisi lectus, tincidunt vel auctor sit amet, dapibus et lorem. Fusce quis leo enim. Suspendisse purus elit, euismod a suscipit sit amet, condimentum vel metus. Proin et arcu non risus vestibulum elementum quis sit amet purus. In cursus ligula a est laoreet, consequat varius orci aliquam. Ut faucibus at metus vel cursus.

                         Nullam tincidunt urna eget enim accumsan porta. Pellentesque quis gravida leo. Donec ut est erat. Cras tempor ligula eu odio eleifend, in euismod metus ullamcorper. Donec purus sapien, aliquam eu ornare quis, dictum sit amet mi. Donec libero lorem, dictum non imperdiet sit amet, interdum id dui. Sed pellentesque diam magna, eu tincidunt metus condimentum eget. Maecenas quis lacus at elit cursus elementum a eget justo. Fusce pulvinar ac lorem non pretium. Suspendisse vitae nunc id purus pellentesque faucibus. Mauris eget scelerisque libero. Proin quis mauris ac sapien porttitor tincidunt in sit amet tortor. Proin quis nisi augue. Pellentesque in feugiat turpis.

                         Vivamus facilisis diam dolor, ac molestie quam tristique sit amet. Sed vestibulum velit eget dapibus aliquam. Pellentesque sed urna neque. Ut a elementum est, id facilisis erat. Nam blandit est eu facilisis pharetra. Nam ultrices velit vitae purus sollicitudin vestibulum. Aenean tempus hendrerit lacus, eget congue urna lobortis vitae. Sed bibendum ultricies enim, a interdum ipsum convallis sed. Nam eget nunc quis urna vulputate tempus. Cras gravida nunc sagittis malesuada ultrices. Proin laoreet libero ac pulvinar consectetur. Nunc pharetra blandit tristique.
                
                """)
                    .font(.system(.headline))
                    Text("© by: Gustavo Assis 2023")
                }
                .frame(width: geometry.size.width * 0.8)
            }
            .foregroundColor(.white)
            .frame(width: geometry.size.width, alignment: .center)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
