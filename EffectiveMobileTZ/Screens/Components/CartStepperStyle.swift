//
//  CartStepperView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI
import Foundation



struct StepperStyleConfiguration {
    var value: Binding<Int>
    var range: ClosedRange<Int>
}

protocol CartStepperStyle {
    associatedtype Body: View
    func makeBody(_ configuration: StepperStyleConfiguration) -> Body
}

struct CartStepper: View {
    @Binding var value: Int
    var `in`: ClosedRange<Int> // todo
    @Environment(\.stepperStyle) var style
    
    var body: some View {
        AnyView(style.makeBody(.init(value: $value, range: `in`)))
    }
}

struct StepperStyleKey: EnvironmentKey {
    static let defaultValue: any CartStepperStyle = VerticalStepperStyle()
}

extension EnvironmentValues {
    var stepperStyle: any CartStepperStyle {
        get { self[StepperStyleKey.self] }
        set { self[StepperStyleKey.self] = newValue }
    }
}

extension View {
    func stepperStyle(_ style: some CartStepperStyle) -> some View {
        environment(\.stepperStyle, style)
    }
}

@available(iOS 16.0, *)
struct VerticalStepperStyle: CartStepperStyle {
    func makeBody(_ configuration: StepperStyleConfiguration) -> some View {
        VStack(spacing: 0) {
            Image("Plus")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(maxWidth:8, maxHeight: 8)
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 5, trailing: 10))
            ZStack {
                Text("99")
                    .hidden()
                Text(configuration.value.wrappedValue.formatted())
                    .textStyle(color: .defined(.white), size: 20, font: .MarkProMedium)
            }
            .monospacedDigit()
            Image("Minus")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(maxWidth:7, maxHeight: 7)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 8, trailing: 10))
        }
        .padding(.vertical, 4)
        .background {
            Rectangle()
                .cornerRadius(26)
                .foregroundColor(
                    Color(red: 0.16,  green: 0.16, blue: 0.26)
                )
        }
        .overlay {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if configuration.value.wrappedValue < 99 {
                            
                            configuration.value.wrappedValue += 1
                        }
                    }
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if configuration.value.wrappedValue > 0 {
                            configuration.value.wrappedValue -= 1
                        }
                    }
            }
        }
    }
}

@available(iOS 16.0, *)
private struct Preview: View {
    @State var value = 0
    
    var body: some View {
        CartStepper(value: $value, in: 0...999)
        //            Text("Quantity")
            .stepperStyle(VerticalStepperStyle())
    }
}

@available(iOS 16.0, *)
struct VerticalStepperStyle_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
            .padding()
    }
}
