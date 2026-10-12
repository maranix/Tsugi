import SwiftUI

struct LibraryView: View {
    @Environment(RouteCoordinator.self) private var coordinator

    @State private var router = NavigationRouter<RouteCoordinator.Destination>()
    @State private var viewModel = LibraryViewModel()
    @State private var gridLayout: GridLayout.Column = .three
    @State private var runTask = false

    func fetchLibrary() async {
        try? await Task.sleep(for: .seconds(1))
        await viewModel.getAll()
    }

    func updateRunTask(_ val: Bool) {
        runTask = val
    }

    var body: some View {
        NavigationStack(path: $router.stack) {
            ServerContentView(onPresentationChanged: updateRunTask) {
                Group {
                    switch viewModel.status {
                    case .success:
                        ScrollableGridSurfaceView(layout: gridLayout.items) {
                            ForEach(viewModel.books) { book in
                                NavigationLink(value: RouteCoordinator.Destination.bookDetails(book)) {
                                    BookCoverView(book)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .buttonStyle(.plain)
                        .scrollIndicators(.never)
                        .refreshable(action: fetchLibrary)
                        .navigationDestination(for: RouteCoordinator.Destination.self) { dest in
                            switch dest {
                            case let .bookDetails(book):
                                BookDetailsView(book)
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                        }
                    case let .failure(msg):
                        VStack {
                            Spacer()
                            Text(msg)
                            Spacer()
                        }
                    default:
                        ProgressView()
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
            .task(id: runTask) {
                await fetchLibrary()
            }
        }
    }
}
