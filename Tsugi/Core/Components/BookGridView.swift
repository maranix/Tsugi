//
//  BookGridView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct BookGridView: View {
    let books: [Book]
    
    let spacing: CGFloat = 16
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: spacing) {
            ForEach(books) { book in
                BookGridItemView(book: book)
            }
        }
    }
}
