//
//  Transitions.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

struct SlidingBlurReplaceTransition: ViewModifier {
    let blur: CGFloat
    let y: CGFloat
    let opacity: Double

    func body(content: Content) -> some View {
        content
            .blur(radius: blur)
            .offset(y: y)
            .opacity(opacity)
    }
}

extension AnyTransition {
    static var slidingBlurReplace: AnyTransition {
        .asymmetric(
            insertion: .modifier(
                active: SlidingBlurReplaceTransition(
                    blur: 10,
                    y: 30,
                    opacity: 0
                ),
                identity: SlidingBlurReplaceTransition(
                    blur: 0,
                    y: 0,
                    opacity: 1
                )
            ),
            removal: .modifier(
                active: SlidingBlurReplaceTransition(
                    blur: 10,
                    y: -60,
                    opacity: 0
                ),
                identity: SlidingBlurReplaceTransition(
                    blur: 0,
                    y: 0,
                    opacity: 1
                )
            )
        )
    }
}
