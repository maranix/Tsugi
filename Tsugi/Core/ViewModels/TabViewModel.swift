//
//  TabViewModel.swift
//  Tsugi
//
//  Created by Raman Verma on 05/10/26.
//

import SwiftUI

@Observable
final class TabViewModel<T: CaseIterable & Equatable> {
    private let cases = Array(T.allCases)

    private var current: T
    private var currentIndex: Int

    var currentPage: T {
        get { current }
        set { setPage(newValue) }
    }

    init(_ start: T) {
        self.current = start

        guard let index = cases.firstIndex(of: start) else {
            fatalError("\(start) does not exist in \(T.self)")
        }

        self.currentIndex = index
    }

    func goNext() {
        if !canGoNext { return }

        let next = currentIndex + 1
        setPage(cases[next], index: next)
    }

    func goPrevious() {
        if !canGoPrevious { return }

        let previous = currentIndex - 1
        setPage(cases[previous], index: previous)
    }

    func isActive(_ page: T) -> Bool {
        page == current
    }

    var canGoNext: Bool {
        cases.indices.contains(currentIndex + 1)
    }

    var canGoPrevious: Bool {
        currentIndex > 0
    }

    private func setPage(_ page: T, index: Int? = nil) {
        if let nextIndex = index {
            currentIndex = nextIndex
        } else {
            currentIndex = indexOfPage(page)
        }

        current = page
    }

    private func indexOfPage(_ page: T) -> Int {
        guard let index = cases.firstIndex(of: page) else {
            fatalError("\(page) does not exist in \(T.self)")
        }

        return index
    }
}
