import SwiftUI

enum GridLayout {
    enum Column: Int {
        case two = 2
        case three = 3

        var items: [GridItem] {
            Array(repeating: GridItem(.flexible()), count: rawValue)
        }

        func build(_ item: GridItem) -> [GridItem] {
            Array(repeating: item, count: rawValue)
        }
    }
}
