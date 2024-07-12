//
//  ContentView.swift
//  AnimatedText
//
//  Created by Sheikh Bayazid on 2024-07-12.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Double = 500
    private let animation = Animation.linear(duration: 1)

    var body: some View {
        VStack(spacing: 40) {
            AnimatedText(currentValue: $value, animation: animation)

            Button("Update") {
                value += 100
            }
        }
    }
}

#Preview {
    ContentView()
}
