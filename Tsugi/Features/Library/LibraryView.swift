import Kingfisher
import SwiftUI

struct LibraryView: View {
    @Environment(AppPreferences.self) private var preferences
    @Environment(RouteCoordinator.self) private var coordinator

    @State private var router = NavigationRouter<RouteCoordinator.Destination>()
    @State private var viewModel = LibraryViewModel()
    @State private var gridLayout = GridLayout.Column.three

    var body: some View {
        NavigationStack(path: $router.stack) {
            ServerContentView {
                Group {
                    switch viewModel.status {
                    case .success:
                        ScrollableGridSurfaceView(layout: gridLayout.items) {
                            ForEach(viewModel.books) { book in
                                NavigationLink(value: RouteCoordinator.Destination.bookDetails(book)) {
                                    BookCoverView(book)
                                }
                            }

                            if viewModel.hasMore {
                                ProgressView()
                                    .frame(maxWidth: .infinity)
                                    .gridCellColumns(gridLayout.items.count)
                                    .task {
                                        await viewModel.loadNext()
                                    }
                            }
                        }
                        .padding(.horizontal)
                        .buttonStyle(.plain)
                        .scrollIndicators(.never)
                        .navigationDestination(for: RouteCoordinator.Destination.self) { dest in
                            switch dest {
                            case let .bookDetails(book):
                                BookContentView(book)
                            }
                        }
                    case let .failure(msg):
                        VStack {
                            Spacer()
                            Text(msg)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    default:
                        VStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Library")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        withAnimation(.easeIn) {
                            gridLayout = .three
                        }
                    } label: {
                        if gridLayout == .three {
                            Image(systemName: "square.grid.3x2.fill")
                        } else {
                            Image(systemName: "square.grid.3x2")
                        }
                    }

                    Button {
                        withAnimation(.easeIn) {
                            gridLayout = .two
                        }
                    } label: {
                        if gridLayout == .two {
                            Image(systemName: "square.grid.2x2.fill")
                        } else {
                            Image(systemName: "square.grid.2x2")
                        }
                    }

                    Button {
                        coordinator.presentSheet(.settings)
                    } label: {
                        Image(systemName: SFSymbol.settings)
                    }
                }
            }
            .task {
                if viewModel.status.isIdle {
                    await viewModel.get()
                }
            }
            .onChange(of: preferences.serverUrl) {
                Task {
                    await viewModel.get()
                }
            }
            .refreshable(action: viewModel.get)
        }
    }
}
