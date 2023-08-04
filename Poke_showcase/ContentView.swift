//
//  ContentView.swift
//  Poke_showcase
//
//  Created by Fuad Khairi Hamid on 04/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Psyduck"
    @State private var imageName: String = "psyduck"
    
    var body: some View {
        ZStack {
            Color(imageName == "psyduck" ? "BgColor" : "BgColor2")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 80) {
                Spacer()
                
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    Text(imageName == "psyduck" ? """
                    It is constantly wracked by a headache. When the headache turns intense, it begins using mysterious powers.
                    """ : """
                    When it swims at full speed using its long, webbed limbs, its forehead somehow begins to glow.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                ZStack {
                    CircleBackground(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 30)))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Golduck"
                                            imageName = "golduck"
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero
                                    
                                    indicatorOpacity = 1
                                    textTitle = "Psyduck"
                                    imageName = "psyduck"
                                }
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                
                Spacer()
                
                
            }
        }
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
