//
//  OnboardingViewModel.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

enum OnboardingStep: Int, CaseIterable {
    case welcome
    case privacy
}

@Observable
final class OnboardingViewModel {
    private let steps = Array(OnboardingStep.allCases)
    private var currentIndex: Int = 0

    var currentStep: OnboardingStep {
        steps[currentIndex]
    }

    var canGoNext: Bool {
        steps.indices.contains(currentIndex + 1)
    }

    var canGoPrevious: Bool {
        currentIndex > 0
    }

    /// Intents
    func goNext() {
        guard canGoNext else {
            return
        }

        withAnimation(.snappy) {
            currentIndex += 1
        }
    }

    func goPrevious() {
        guard canGoPrevious else {
            return
        }

        withAnimation(.snappy) {
            currentIndex -= 1
        }
    }
}
