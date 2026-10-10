import Foundation

struct Manga: Identifiable, Hashable, Sendable {
    let id: Int
    let title: String
    let thumbnailURL: URL?
}
