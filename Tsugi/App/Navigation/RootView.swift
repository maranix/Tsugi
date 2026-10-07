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
        MainShellView()
            .fullScreenCover(
                isPresented: .init(
                    get: { !isOnboarded },
                    set: { val in
                        isOnboarded = !val
                    }
                ),
            ) {
                OnboardingPage()
            }
    }
}
