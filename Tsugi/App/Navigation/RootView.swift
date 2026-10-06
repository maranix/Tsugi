//
//  RootView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct RootView: View {
    @State private var serverStore = ServerStore()

    var body: some View {
        OnboardingPage()
//        Group {
//            if serverStore.isConfigured {
//                MainShellView()
//            } else {
//                OnboardingView()
//            }
//        }
//        .animation(.default, value: serverStore.isConfigured)
        .environment(serverStore)
    }
}
