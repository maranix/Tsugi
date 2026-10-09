import SwiftUI

struct SplashView: View {
    @Environment(Router.self) private var router
    @Environment(\.onboardingStorage) private var onboardingStorage

    var body: some View {
        VStack {
            Text("Tsugi")
                .font(.title)
                .fontWeight(.bold)
        }
        .task(id: onboardingStorage.onboarded) {
            withAnimation(.easeIn) {
                if onboardingStorage.onboarded {
                    router.pushRoot(.homeShell)
                } else {
                    router.pushSheet(.onboarding)
                }
            }
        }
    }
}
