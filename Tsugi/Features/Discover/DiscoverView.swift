//
//  DiscoverView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct DiscoverView: View {
    @Environment(MockBooksViewModel.self) private var viewModel
    
    @State private var searchQuery: String = ""
    
    var body: some View {
        ScrollView {
            BookGridView(books: viewModel.books)
                .padding(.horizontal)
        }
        .navigationTitle("Discover")
        .searchable(text: $searchQuery)
        .toolbar {
            DefaultToolbarItem(kind: .title, placement: .title)
            DefaultToolbarItem(kind: .search, placement: .automatic)
        }
        .scrollIndicators(.never)
    }
}
