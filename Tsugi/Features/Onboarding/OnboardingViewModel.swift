//
//  OnboardingViewModel.swift
//  Tsugi
//
//  Created by Raman Verma on 06/10/26.
//

import SwiftUI

enum OnboardingStep: Int, CaseIterable {
    case welcome
    case server
}

@Observable
final class OnboardingViewModel {
    private let userDefaults: UserDefaults
    
    private let tabVM = TabViewModel<OnboardingStep>(.welcome)
    
    var showAddServerSheet = false
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    var currentStep: OnboardingStep {
        tabVM.currentPage
    }

    var showAddServerButton: Bool {
        currentStep == .server
    }

    var canGoNext: Bool {
        tabVM.canGoNext
    }

    var canGoPrevious: Bool {
        tabVM.canGoPrevious
    }
    
    // Intents
    func goNext() {
        withAnimation(.snappy) {
            tabVM.goNext()
        }
    }

    func goPrevious() {
        withAnimation(.snappy) {
            tabVM.goPrevious()
        }
    }

    func openAddServerSheet() {
        showAddServerSheet = true
    }
    
    func completeOnboarding() {
        userDefaults.set(true, forKey: StorageKey.Onboarding.completed)
    }
}
