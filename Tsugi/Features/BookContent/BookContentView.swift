import Kingfisher
import SwiftUI

struct BookContentView: View {
    @State private var viewModel: BookContentViewModel
    @State private var coverHeight: CGFloat = 0
    @State private var scrollOffset: CGPoint = .zero

    private var blurProgress: CGFloat {
        min(1.0, scrollOffset.y / coverHeight * 0.7)
    }

    init(_ book: Book) {
        _viewModel = State(initialValue: BookContentViewModel(book))
    }

    var body: some View {
        ZStack(alignment: .top) {
            KFImage(viewModel.book.thumbnailUrl)
                .resizable()
                .scaledToFit()
                .blur(radius: blurProgress)
                .onGeometryChange(for: CGFloat.self) { geo in
                    geo.size.height
                } action: { newValue in
                    coverHeight = newValue
                }
                .overlay {
                    Rectangle()
                        .fill(.regularMaterial)
                        .mask {
                            LinearGradient(
                                stops: [
                                    .init(color: .black, location: 0.0), // 100% blur at bottom
                                    .init(color: .black.opacity(0.8), location: 0.25),
                                    .init(color: .clear, location: 0.65), // 0% blur at top
                                ],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        }
                }
                .blur(radius: blurProgress * 25)
                .opacity(1.0 - (blurProgress * 0.4))

            ScrollView {
                VStack(spacing: 0) {
                    Color
                        .clear
                        .frame(height: coverHeight * 0.65)

                    Text(viewModel.book.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)

                    VStack(alignment: .leading, spacing: 20) {
                        Details()
                        Chapters()
                    }
                    .padding()
                    .background {
                        Rectangle()
                            .fill(.regularMaterial)
                            .mask {
                                LinearGradient(
                                    stops: [
                                        .init(color: .black, location: 0.0), // 100% blur at bottom
                                        .init(color: .black.opacity(0.8), location: 0.25),
                                        .init(color: .clear, location: 0.65), // 0% blur at top
                                    ],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            }
                    }
                }
            }
            .refreshable(action: viewModel.refreshContent)
            .onScrollGeometryChange(for: CGPoint.self) { geo in
                geo.contentOffset
            } action: { _, newValue in
                scrollOffset = newValue
            }
        }
        .ignoresSafeArea(edges: .vertical)
        .toolbarVisibility(.hidden, for: .tabBar)
        .task {
            await viewModel.loadContent()
        }
        .environment(viewModel)
    }
}

private struct Details: View {
    @Environment(BookContentViewModel.self) private var viewModel

    var body: some View {
        if let description = viewModel.content.details.description, !description.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
                Text(description)
                    .foregroundStyle(.white)
            }
        }
    }
}

private struct Chapters: View {
    @Environment(BookContentViewModel.self) private var viewModel

    var body: some View {
        if !viewModel.content.chapters.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
                Text("Chapters")
                    .font(.title2)
                    .foregroundStyle(.white)

                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.content.chapters) { chapter in
                        Text(chapter.displayName)
                            .padding(.vertical)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}
