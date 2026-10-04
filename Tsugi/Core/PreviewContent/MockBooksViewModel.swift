//
//  MockBooksViewModel.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

@Observable
final class MockBooksViewModel {
    private(set) var books: [Book] = []
    
    fileprivate let imageURLs: [URL] = [
        URL(string: "https://unsplash.com/photos/R0xNpLLZNdg/download?force=true&w=640")!,
        URL(string: "https://unsplash.com/photos/evL40y7KVIU/download?force=true&w=640")!,
        URL(string: "https://unsplash.com/photos/xpThSeIyGlw/download?force=true&w=640")!,
        URL(string: "https://unsplash.com/photos/bx5kehBQTMA/download?force=true&w=640")!,
        URL(string: "https://unsplash.com/photos/oiOYEbNGQoE/download?force=true&w=640")!
    ]
    
    init(count: Int = 50) {
        for i in 1...count {
            self.books.append(
                Book(
                    id: i,
                    title: "Book \(i)",
                    imageURL: imageURLs[i % imageURLs.count]
                )
            )
        }
    }
    
    func delete(book: Book) {
        self.books.removeAll(where: {$0.id == book.id})
    }
}
