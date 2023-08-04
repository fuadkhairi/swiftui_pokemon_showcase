//
//  CircleGroupView.swift
//  Onboarding_swiftui
//
//  Created by Fuad Khairi Hamid on 04/08/23.
//

import SwiftUI

struct CircleBackground: View {
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 60)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("BgColor")
                .ignoresSafeArea(.all, edges: .all)
            CircleBackground(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
