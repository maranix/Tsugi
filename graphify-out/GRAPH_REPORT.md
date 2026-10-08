# Graph Report - Tsugi  (2026-10-08)

## Corpus Check
- 16 files · ~2,101 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 155 nodes · 218 edges · 16 communities (11 shown, 5 thin omitted)
- Extraction: 91% EXTRACTED · 9% INFERRED · 0% AMBIGUOUS · INFERRED: 20 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Main Features and Content Views
- Server Setup and URL Validation
- Server Health and Network Client
- App Lifecycle and Root Navigation
- Onboarding Screens and App Icons
- Onboarding State and Step Navigation
- Tab Pagination View Model
- Async State Types
- Server Storage and Persistence
- Custom Transitions and View Modifiers
- Storage Keys and Namespaces

## God Nodes (most connected - your core abstractions)
1. `AddServerSheetViewModel` - 14 edges
2. `TabViewModel` - 13 edges
3. `AsyncStatus` - 12 edges
4. `ServerStore` - 10 edges
5. `URLScheme` - 10 edges
6. `OnboardingViewModel` - 9 edges
7. `OnboardingPage` - 8 edges
8. `ServerStorage` - 7 edges
9. `SlidingBlurReplaceTransition` - 6 edges
10. `ServerHealthService` - 6 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `OnboardingPage`  [INFERRED]
  Tsugi/App/Navigation/RootView.swift → Tsugi/Features/Onboarding/OnboardingPage.swift
- `TsugiApp` --calls--> `ServerStore`  [INFERRED]
  Tsugi/App/TsugiApp.swift → Tsugi/Core/Storage/ServerStorage.swift
- `OnboardingPage` --calls--> `OnboardingViewModel`  [INFERRED]
  Tsugi/Features/Onboarding/OnboardingPage.swift → Tsugi/Features/Onboarding/OnboardingViewModel.swift
- `.body` --calls--> `MainShellView`  [INFERRED]
  Tsugi/App/Navigation/RootView.swift → Tsugi/App/Navigation/MainShellView.swift
- `.body` --calls--> `DiscoverView`  [INFERRED]
  Tsugi/App/Navigation/MainShellView.swift → Tsugi/Features/Discover/DiscoverView.swift

## Import Cycles
- None detected.

## Communities (16 total, 5 thin omitted)

### Community 0 - "Main Features and Content Views"
Cohesion: 0.13
Nodes (11): .body, DiscoverView, .body, LibraryView, .body, AddServerSheetView, .body, FormStatusSection (+3 more)

### Community 1 - "Server Setup and URL Validation"
Cohesion: 0.13
Nodes (11): .body, AddServerSheetViewModel, .host, .port, .scheme, URLScheme, .displayName, http (+3 more)

### Community 2 - "Server Health and Network Client"
Cohesion: 0.17
Nodes (4): Foundation, ServerConfig, DefaultServerHealthService, ServerHealthService

### Community 3 - "App Lifecycle and Root Navigation"
Cohesion: 0.14
Nodes (9): SwiftData, MainShellTab, discover, library, MainShellView, RootView, .body, TsugiApp (+1 more)

### Community 4 - "Onboarding Screens and App Icons"
Cohesion: 0.16
Nodes (8): SwiftUI, AppIcon, OnboardingPage, .content, OnboardingPrivacyView, .body, OnboardingWelcomeView, .body

### Community 5 - "Onboarding State and Step Navigation"
Cohesion: 0.16
Nodes (8): .body, OnboardingStep, privacy, welcome, OnboardingViewModel, .canGoNext, .canGoPrevious, .currentStep

### Community 6 - "Tab Pagination View Model"
Cohesion: 0.29
Nodes (4): TabViewModel, .canGoNext, .canGoPrevious, .currentPage

### Community 7 - "Async State Types"
Cohesion: 0.17
Nodes (9): AsyncStatus, failure, .failureMessage, idle, .isFailure, .isLoading, .isSuccess, loading (+1 more)

### Community 8 - "Server Storage and Persistence"
Cohesion: 0.27
Nodes (3): ServerStorage, ServerStore, .isConfigured

### Community 9 - "Custom Transitions and View Modifiers"
Cohesion: 0.22
Nodes (3): AnyTransition, .slidingBlurReplace, SlidingBlurReplaceTransition

### Community 10 - "Storage Keys and Namespaces"
Cohesion: 0.50
Nodes (3): Onboarding, Server, StorageKey

## Knowledge Gaps
- **35 isolated node(s):** `AppIcon`, `.canGoNext`, `.canGoPrevious`, `library`, `discover` (+30 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 63 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `SwiftUI` connect `Onboarding Screens and App Icons` to `Main Features and Content Views`, `Server Setup and URL Validation`, `App Lifecycle and Root Navigation`, `Onboarding State and Step Navigation`, `Custom Transitions and View Modifiers`?**
  _High betweenness centrality (0.404) - this node is a cross-community bridge._
- **What connects `AppIcon`, `.canGoNext`, `.canGoPrevious` to the rest of the system?**
  _35 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Main Features and Content Views` be split into smaller, more focused modules?**
  _Cohesion score 0.13333333333333333 - nodes in this community are weakly interconnected._
- **Why does `AddServerSheetViewModel` connect `Server Setup and URL Validation` to `Main Features and Content Views`, `Server Storage and Persistence`, `Server Health and Network Client`, `Async State Types`?**
  _High betweenness centrality (0.386) - this node is a cross-community bridge._
- **Should `Server Setup and URL Validation` be split into smaller, more focused modules?**
  _Cohesion score 0.13071895424836602 - nodes in this community are weakly interconnected._
- **Why does `AddServerSheetView` connect `Main Features and Content Views` to `Server Setup and URL Validation`?**
  _High betweenness centrality (0.140) - this node is a cross-community bridge._
- **Should `App Lifecycle and Root Navigation` be split into smaller, more focused modules?**
  _Cohesion score 0.14285714285714285 - nodes in this community are weakly interconnected._