import SwiftUI

struct MangaGridView<Content: View>: View {
    enum ScrollDirection {
        case vertical(HorizontalAlignment)
        case horizontal(VerticalAlignment)
    }

    private let direction: ScrollDirection
    private let layout: [GridItem]
    private let spacing: CGFloat?

    @ViewBuilder
    private var content: Content

    init(
        _ direction: ScrollDirection = .vertical(.leading),
        layout: [GridItem] = [],
        spacing: CGFloat? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.direction = direction
        self.layout = layout
        self.spacing = spacing
        self.content = content()
    }

    var body: some View {
        switch direction {
        case let .vertical(alignment):
            ScrollView(.vertical) {
                LazyVGrid(
                    columns: layout,
                    alignment: alignment,
                    spacing: spacing
                ) {
                    content
                }
            }
        case let .horizontal(alignment):
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: layout,
                    alignment: alignment,
                    spacing: spacing
                ) {
                    content
                }
            }
        }
    }
}
