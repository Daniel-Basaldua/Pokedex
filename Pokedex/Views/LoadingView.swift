//
//  LoadingView.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 12/2/22.
//

import SwiftUI

struct LoadingView: View {
    @State var spinnerStart: CGFloat = 0.0
    @State var spinnerEnd: CGFloat = 0.1
    @State var rotationDegree: Angle = .degrees(270)
    
    let rotationTime: Double = 1.0
    let fullRotation: Angle = .degrees(360)
    
    var body: some View {
        ZStack {
            Spinner(start: spinnerStart, end: spinnerEnd, rotation: rotationDegree, color: .red)
        }.frame(width: 200, height: 200)
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (mainTimer) in
                animateSpinner(with: (rotationTime * 2) - 0.025) {
                    self.rotationDegree += fullRotation
                }
            }
        }
    }
    
    func animateSpinner(with duration: Double, completion: @escaping (() -> Void)) {
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            withAnimation(Animation.easeInOut(duration: self.rotationTime)) {
                completion()
            }
        }
    }
}

struct Spinner: View {
    var start: CGFloat
    var end: CGFloat
    var rotation: Angle
    var color: Color

    var body: some View {
        Circle()
            .trim(from: start, to: end)
            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
            .fill(color)
            .rotationEffect(rotation)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
