//
//  SegmentedControllButtonView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

internal struct SegmentedControlButtonView: View {
    @Binding private var selectedIndex: Int
    @Binding private var frames: [CGRect]
    @Binding private var backgroundFrame: CGRect

    private let titles: [String]

    init(selectedIndex: Binding<Int>, frames: Binding<[CGRect]>, backgroundFrame: Binding<CGRect>, titles: [String])
    {
        _selectedIndex = selectedIndex
        _frames = frames
        _backgroundFrame = backgroundFrame

        self.titles = titles
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(titles.indices, id: \.self) { index in
                Button(action:{ selectedIndex = index })
                {
                    HStack {
                        if selectedIndex == index {
                            Text(titles[index])
                                .textStyle(color:  .background, size: 20, font: .MarkProBold)
                        }
                        else {
                            Text(titles[index])
                                .textStyle(color: .transparentGray, size: 20, font: .MarkProRegular)
                        }
                       
//                            .frame(height: 42)
                    }
                }
                .buttonStyle(CustomSegmentButtonStyle())
                .background(
                    GeometryReader { geoReader in
                        Color.clear.preference(key: RectPreferenceKey.self, value: geoReader.frame(in: .global))
                            .onPreferenceChange(RectPreferenceKey.self) {
                                self.setFrame(index: index, frame: $0)
                            }
                    }
                )
                if index != titles.count - 1 {
                    Spacer()
                }
            }
        }
        .modifier(UnderlineModifier(selectedIndex: selectedIndex, frames: frames))
    }

    private func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}

struct UnderlineModifier: ViewModifier
{
    var selectedIndex: Int
    let frames: [CGRect]

    func body(content: Content) -> some View
    {
        withAnimation {
            content
                .background(
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: frames[selectedIndex].width, height: 3)
                        .offset(x: frames[selectedIndex].minX - frames[0].minX), alignment: .bottomLeading
                )
        }
    }
}
