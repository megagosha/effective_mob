//
//  RectPreference.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

struct RectPreferenceKey: PreferenceKey
{
    typealias Value = CGRect

    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect)
    {
        value = nextValue()
    }
}
