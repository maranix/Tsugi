# Graph Report - Tsugi  (2026-10-06)

## Corpus Check
- Corpus is ~1,438 words - fits in a single context window. You may not need a graph.

## Summary
- 98 nodes · 142 edges · 10 communities (9 shown, 1 thin omitted)
- Extraction: 87% EXTRACTED · 13% INFERRED · 0% AMBIGUOUS · INFERRED: 18 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Discover and Library Views
- Book Models and Mock ViewModels
- Root and Onboarding Navigation
- Custom Transitions and Modifiers
- Server Configuration Store
- Tab Navigation State
- Localization and Strings
- Main Shell Tab Navigation
- App Lifecycle and Setup
- Book Grid Item Components

## God Nodes (most connected - your core abstractions)
1. `Book` - 13 edges
2. `TabViewModel` - 10 edges
3. `BookGridView` - 8 edges
4. `ServerStore` - 8 edges
5. `BookGridItemView` - 6 edges
6. `SlidingBlurReplaceTransition` - 6 edges
7. `MockBooksViewModel` - 6 edges
8. `OnboardingPage` - 6 edges
9. `OnboardingServerView` - 6 edges
10. `MainShellTab` - 5 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `RootView`  [INFERRED]
  Tsugi/App/TsugiApp.swift → Tsugi/App/Navigation/RootView.swift
- `MainShellView` --calls--> `MockBooksViewModel`  [INFERRED]
  Tsugi/App/Navigation/MainShellView.swift → Tsugi/Core/PreviewContent/MockBooksViewModel.swift
- `.body` --calls--> `DiscoverView`  [INFERRED]
  Tsugi/App/Navigation/MainShellView.swift → Tsugi/Features/Discover/DiscoverView.swift
- `.body` --calls--> `LibraryView`  [INFERRED]
  Tsugi/App/Navigation/MainShellView.swift → Tsugi/Features/Library/LibraryView.swift
- `RootView` --calls--> `ServerStore`  [INFERRED]
  Tsugi/App/Navigation/RootView.swift → Tsugi/Core/Storage/ServerStore.swift

## Import Cycles
- None detected.

## Communities (10 total, 1 thin omitted)

### Community 0 - "Discover and Library Views"
Cohesion: 0.14
Nodes (7): SwiftUI, BookGridView, AppIcon, DiscoverView, .body, LibraryView, .body

### Community 2 - "Root and Onboarding Navigation"
Cohesion: 0.19
Nodes (8): RootView, .body, OnboardingPage, .content, OnboardingServerView, .mainTitle, OnboardingWelcomeView, .body

### Community 3 - "Custom Transitions and Modifiers"
Cohesion: 0.22
Nodes (3): AnyTransition, .slidingBlurReplace, SlidingBlurReplaceTransition

### Community 4 - "Server Configuration Store"
Cohesion: 0.20
Nodes (4): Foundation, ServerStore, .isConfigured, .url

### Community 5 - "Tab Navigation State"
Cohesion: 0.36
Nodes (3): TabViewModel, .currentPage, .body

### Community 6 - "Localization and Strings"
Cohesion: 0.36
Nodes (6): Button, Disclaimer, General, Onboarding, Strings, .body

### Community 7 - "Main Shell Tab Navigation"
Cohesion: 0.33
Nodes (5): MainShellTab, discover, library, MainShellView, .body

### Community 8 - "App Lifecycle and Setup"
Cohesion: 0.33
Nodes (3): SwiftData, TsugiApp, .body

### Community 9 - "Book Grid Item Components"
Cohesion: 0.40
Nodes (3): BookGridItemView, .body, .body

## Knowledge Gaps
- **9 isolated node(s):** `library`, `discover`, `SwiftData`, `.body`, `AppIcon` (+4 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 30 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `SwiftUI` connect `Discover and Library Views` to `Book Models and Mock ViewModels`, `Root and Onboarding Navigation`, `Custom Transitions and Modifiers`, `Localization and Strings`, `Main Shell Tab Navigation`, `App Lifecycle and Setup`, `Book Grid Item Components`?**
  _High betweenness centrality (0.449) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `BookGridView` (e.g. with `.body` and `.body`) actually correct?**
  _`BookGridView` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `library`, `discover`, `SwiftData` to the rest of the system?**
  _9 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Discover and Library Views` be split into smaller, more focused modules?**
  _Cohesion score 0.14166666666666666 - nodes in this community are weakly interconnected._
- **Why does `Book` connect `Book Models and Mock ViewModels` to `Discover and Library Views`, `Book Grid Item Components`, `Server Configuration Store`, `Main Shell Tab Navigation`?**
  _High betweenness centrality (0.192) - this node is a cross-community bridge._
- **Why does `RootView` connect `Root and Onboarding Navigation` to `App Lifecycle and Setup`, `Server Configuration Store`?**
  _High betweenness centrality (0.182) - this node is a cross-community bridge._