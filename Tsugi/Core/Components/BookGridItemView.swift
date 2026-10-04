//
//  BookGridItemView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct BookGridItemView: View {
    public let book: Book
    
    fileprivate let bookAspectRatio: CGFloat = 2.5/3
    
    var body: some View {
        VStack(alignment: .leading)  {
            // Cover Image
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
                .aspectRatio(2.5/3, contentMode: .fit)
                .overlay {
                    AsyncImage(url: book.imageURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else if phase.error != nil {
                            Image(systemName: "book.closed")
                                .font(.title)
                                .foregroundStyle(.secondary)
                        } else {
                            ProgressView()
                        }
        
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))

            // Title
            Text(book.title)
                .font(.title3)
                .lineLimit(1)
        }
    }
}
