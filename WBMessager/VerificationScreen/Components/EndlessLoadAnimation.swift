//
//  Animation.swift
//  WBMessager
//
//  Created by Anna on 08.07.2024.
//

import SwiftUI

struct EndlessLoadAnimation: View {
    
    @State var degreesRotating = 0.0
    
    var body: some View {
        Circle()
            .stroke(LinearGradient(colors: [Color.designColor.firstGradientLightColor, Color.designColor.secondGradientLightColor], startPoint: .leading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 7, dash: [40,5]))
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(degreesRotating))
            .onAppear {
                withAnimation(.linear(duration: 1)
                    .speed(0.05).repeatForever(autoreverses: false)) {
                        degreesRotating = 360.0
                    }
            }
    }
}


struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        EndlessLoadAnimation()
    }
}
