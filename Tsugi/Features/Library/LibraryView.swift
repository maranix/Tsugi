import SwiftUI

struct LibraryView: View {
    @Environment(MainRouter.self) private var mainRouter

    @State private var router = NavigationRouter<AppRoute.Destination>()
    @State private var viewModel = LibraryViewModel()
    @State private var gridLayout: GridLayout.Column = .three

    var body: some View {
        NavigationStack(path: $router.stack) {
            Group {
                switch viewModel.status {
                case .success:
                    MangaGridView(layout: gridLayout.items) {
                        ForEach(viewModel.mangas) { manga in
                            MangaView(manga)
                        }
                    }
                case let .failure(msg):
                    Text(msg)
                default:
                    ProgressView()
                }
            }
            .padding(.horizontal)
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
                        mainRouter.pushSheet(.settings)
                    } label: {
                        Image(systemName: SFSymbol.settings)
                    }
                }

                ToolbarSpacer(.flexible, placement: .bottomBar)
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
            }
            .searchable(text: $viewModel.searchText)
            .searchToolbarBehavior(.minimize)
            .scrollIndicators(.never)
            .navigationDestination(for: AppRoute.Destination.self) { dest in
                switch dest {
                case let .item(index):
                    Text("Item Page")
                        .navigationTitle("Item \(index)")
                }
            }
        }
        .refreshable {
            await viewModel.getAll()
        }
        .task {
            try? await Task.sleep(for: .seconds(1))
            await viewModel.getAll()
        }
    }
}
