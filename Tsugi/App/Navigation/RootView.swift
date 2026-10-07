//
//  RootView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct RootView: View {
    @AppStorage(StorageKey.Onboarding.completed) private var isOnboarded = false

    var body: some View {
        Group {
            if isOnboarded {
                MainShellView()
            } else {
                OnboardingPage(onComplete: {
                    isOnboarded = true
                })
            }
        }
        .animation(.easeIn, value: isOnboarded)
    }
}
