//
//  LibraryView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct LibraryView: View {
    @State private var searchQuery: String = ""

    var body: some View {
        ScrollView {}
            .navigationTitle("Library")
            .searchable(text: $searchQuery)
            .scrollIndicators(.never)
    }
}

#Preview {
    LibraryView()
}
