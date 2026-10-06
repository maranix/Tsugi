//
//  DiscoverView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct LibraryView: View {
    @Environment(MockBooksViewModel.self) private var viewModel
    
    
    @State private var searchQuery: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                BookGridView(books: viewModel.books)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(Strings.General.library)
        .searchable(text: $searchQuery)
        .toolbar {
            DefaultToolbarItem(kind: .title, placement: .title)
            DefaultToolbarItem(kind: .search, placement: .automatic)
        }
        .scrollIndicators(.never)
    }
}
