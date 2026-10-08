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
        current = start
        currentIndex = cases.firstIndex(of: start) ?? 0
    }

    func goNext() {
        guard canGoNext else {
            return
        }

        let next = currentIndex + 1
        setPage(cases[next], index: next)
    }

    func goPrevious() {
        guard canGoPrevious else {
            return
        }

        let previous = currentIndex - 1
        setPage(cases[previous], index: previous)
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
        cases.firstIndex(of: page) ?? currentIndex
    }
}
