//
//  AnimatedText.swift
//  AnimatedText
//
//  Created by Sheikh Bayazid on 2024-07-12.
//

import SwiftUI

struct AnimatedText: View {
    private let initialValue: Double?
    @Binding private var currentValue: Double
    private let animation: Animation

    @State private var animatableValue: Double

    init(
        initialValue: Double? = nil,
        currentValue: Binding<Double>,
        animation: Animation = .linear(duration: 1)
    ) {
        self.initialValue = initialValue
        self._currentValue = currentValue
        self.animation = animation

        self.animatableValue = initialValue ?? 0
    }

    var body: some View {
        AnimatableText(value: animatableValue)
            .animation(animation, value: animatableValue)
            .onAppear {
                animatableValue = currentValue
            }
            .onChange(of: currentValue) {
                animatableValue = currentValue
            }
    }
}

private struct AnimatableText: View, Animatable {
    var value: Double

    var animatableData: Double {
        get {
            value
        }
        set {
            value = newValue
        }
    }

    var body: some View {
        Text(String(format: "%.f", value))
            .font(.largeTitle)
            .foregroundColor(.indigo)
    }
}

#Preview {
    AnimatedText(currentValue: .constant(777))
}
