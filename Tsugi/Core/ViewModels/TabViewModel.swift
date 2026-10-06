//
//  TabViewModel.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

@Observable
final class TabViewModel {
    private let maxPage: Int
    
    private var index: Int
    
    var currentPage: Int {
        get {
            index
        }
        
        set {
            setPage(newPage: newValue)
        }
    }

    init(max maxPage: Int, start index: Int = 0) {
        self.maxPage = maxPage
        self.index = index
    }
    
    func nextPage() {
        let next = index + 1
        
        setPage(newPage: next)
    }
    
    func previousPage() {
        let prev = index - 1
        
        setPage(newPage: prev)
    }
    
    func isActive(page: Int) -> Bool {
        page == currentPage
    }
    
    private func setPage(newPage: Int) {
        if newPage > maxPage - 1 {
            return
        } else if newPage < 0 {
            return
        }
        
        index = newPage
    }
}
