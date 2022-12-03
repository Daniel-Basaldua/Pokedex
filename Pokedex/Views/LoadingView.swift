//
//  LoadingView.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 12/2/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("CSE 412")
                .font(.largeTitle)
            Text("Group Project")
                .font(.title2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
