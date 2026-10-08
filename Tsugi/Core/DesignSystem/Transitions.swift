//
//  Transitions.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

struct SlidingBlurReplaceTransition: ViewModifier {
    let blur: CGFloat
    let yAxis: CGFloat
    let opacity: Double

    func body(content: Content) -> some View {
        content
            .blur(radius: blur)
            .offset(y: yAxis)
            .opacity(opacity)
    }
}

extension AnyTransition {
    static var slidingBlurReplace: AnyTransition {
        .asymmetric(
            insertion: .modifier(
                active: SlidingBlurReplaceTransition(
                    blur: 10,
                    yAxis: 30,
                    opacity: 0
                ),
                identity: SlidingBlurReplaceTransition(
                    blur: 0,
                    yAxis: 0,
                    opacity: 1
                )
            ),
            removal: .modifier(
                active: SlidingBlurReplaceTransition(
                    blur: 10,
                    yAxis: -60,
                    opacity: 0
                ),
                identity: SlidingBlurReplaceTransition(
                    blur: 0,
                    yAxis: 0,
                    opacity: 1
                )
            )
        )
    }
}
