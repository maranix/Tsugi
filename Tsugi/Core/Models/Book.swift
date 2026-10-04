//
//  Book.swift
//  Tsugi
//
//  Created by Raman Verma on 04/10/26.
//

import Foundation

struct Book: Identifiable, Hashable, Sendable {
    let id: Int
    let title: String
    let imageURL: URL
    
    init(id: Int, title: String, imageURL: URL) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
}
