//
//  DiscoverView.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import SwiftUI

struct DiscoverView: View {
    @State private var searchQuery: String = ""

    var body: some View {
        ScrollView {}
            .navigationTitle(.generalDiscover)
            .searchable(text: $searchQuery)
            .scrollIndicators(.never)
    }
}
