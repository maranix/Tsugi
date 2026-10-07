# Graph Report - Tsugi  (2026-10-07)

## Corpus Check
- 20 files · ~2,600 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 183 nodes · 276 edges · 11 communities (10 shown, 1 thin omitted)
- Extraction: 90% EXTRACTED · 10% INFERRED · 0% AMBIGUOUS · INFERRED: 27 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Shell Navigation and Core Views
- Server Setup and Sheet Views
- Book Grid and Preview Components
- Onboarding Flow and State
- Server Configuration and Storage
- Tab Pagination View Model
- Async Status State Types
- Server Health Service
- Custom Transitions and Animations
- App Lifecycle and Entry Point
- Storage Keys and Namespaces

## God Nodes (most connected - your core abstractions)
1. `AddServerSheetViewModel` - 18 edges
2. `OnboardingViewModel` - 14 edges
3. `Book` - 13 edges
4. `TabViewModel` - 13 edges
5. `AsyncStatus` - 12 edges
6. `ServerStore` - 11 edges
7. `FormStatusSection` - 10 edges
8. `URLScheme` - 10 edges
9. `ServerConfig` - 8 edges
10. `AddServerSheetView` - 7 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `BookGridItemView`  [INFERRED]
  Tsugi/Core/Components/BookGridView.swift → Tsugi/Core/Components/BookGridItemView.swift
- `.body` --calls--> `AddServerSheetView`  [INFERRED]
  Tsugi/App/Navigation/MainShellView.swift → Tsugi/Features/ServerSetup/AddServerSheetView.swift
- `.body` --calls--> `RootView`  [INFERRED]
  Tsugi/App/TsugiApp.swift → Tsugi/App/Navigation/RootView.swift
- `TsugiApp` --calls--> `ServerStore`  [INFERRED]
  Tsugi/App/TsugiApp.swift → Tsugi/Core/Storage/ServerStorage.swift
- `OnboardingPage` --calls--> `OnboardingViewModel`  [INFERRED]
  Tsugi/Features/Onboarding/OnboardingPage.swift → Tsugi/Features/Onboarding/OnboardingViewModel.swift

## Import Cycles
- None detected.

## Communities (11 total, 1 thin omitted)

### Community 0 - "Shell Navigation and Core Views"
Cohesion: 0.08
Nodes (22): SwiftUI, MainShellTab, discover, library, MainShellView, .body, RootView, .body (+14 more)

### Community 1 - "Server Setup and Sheet Views"
Cohesion: 0.10
Nodes (18): AddServerSheetView, .body, FormStatusSection, .body, .failureContent, .isSuccessOrFailure, .successContent, SheetToolbar (+10 more)

### Community 2 - "Book Grid and Preview Components"
Cohesion: 0.12
Nodes (6): BookGridItemView, .body, BookGridView, .body, Book, MockBooksViewModel

### Community 3 - "Onboarding Flow and State"
Cohesion: 0.12
Nodes (10): .body, .body, OnboardingStep, server, welcome, OnboardingViewModel, .canGoNext, .canGoPrevious (+2 more)

### Community 4 - "Server Configuration and Storage"
Cohesion: 0.14
Nodes (6): Foundation, ServerConfig, ServerStorage, ServerStore, .isConfigured, .body

### Community 5 - "Tab Pagination View Model"
Cohesion: 0.29
Nodes (4): TabViewModel, .canGoNext, .canGoPrevious, .currentPage

### Community 6 - "Async Status State Types"
Cohesion: 0.17
Nodes (9): AsyncStatus, failure, .failureMessage, idle, .isFailure, .isLoading, .isSuccess, loading (+1 more)

### Community 8 - "Custom Transitions and Animations"
Cohesion: 0.22
Nodes (3): AnyTransition, .slidingBlurReplace, SlidingBlurReplaceTransition

### Community 9 - "App Lifecycle and Entry Point"
Cohesion: 0.33
Nodes (3): SwiftData, TsugiApp, .body

### Community 10 - "Storage Keys and Namespaces"
Cohesion: 0.50
Nodes (3): Onboarding, Server, StorageKey

## Knowledge Gaps
- **40 isolated node(s):** `.body`, `library`, `discover`, `SwiftData`, `AppIcon` (+35 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 67 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `SwiftUI` connect `Shell Navigation and Core Views` to `Server Setup and Sheet Views`, `Book Grid and Preview Components`, `Onboarding Flow and State`, `Custom Transitions and Animations`, `App Lifecycle and Entry Point`?**
  _High betweenness centrality (0.386) - this node is a cross-community bridge._
- **What connects `.body`, `library`, `discover` to the rest of the system?**
  _40 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Shell Navigation and Core Views` be split into smaller, more focused modules?**
  _Cohesion score 0.07957957957957958 - nodes in this community are weakly interconnected._
- **Why does `AddServerSheetViewModel` connect `Server Setup and Sheet Views` to `Server Configuration and Storage`, `Async Status State Types`, `Server Health Service`?**
  _High betweenness centrality (0.328) - this node is a cross-community bridge._
- **Should `Server Setup and Sheet Views` be split into smaller, more focused modules?**
  _Cohesion score 0.0960591133004926 - nodes in this community are weakly interconnected._
- **Why does `TabViewModel` connect `Tab Pagination View Model` to `Shell Navigation and Core Views`?**
  _High betweenness centrality (0.124) - this node is a cross-community bridge._
- **Should `Book Grid and Preview Components` be split into smaller, more focused modules?**
  _Cohesion score 0.12380952380952381 - nodes in this community are weakly interconnected._