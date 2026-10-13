# Graph Report - Tsugi  (2026-10-13)

## Corpus Check
- 47 files · ~6,176 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 445 nodes · 694 edges · 22 communities (18 shown, 4 thin omitted)
- Extraction: 94% EXTRACTED · 6% INFERRED · 0% AMBIGUOUS · INFERRED: 44 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Apollo Client & Book Covers
- Suwayomi GraphQL Chapters
- Manga Details Queries
- Chapter Queries & Cursors
- GraphQL Schema & Node Lists
- Manga List Queries
- Onboarding & Privacy Flow
- App Routing & Navigation
- Preferences & Core Storage
- Layout & Grid System
- Scrollable Grid Surface Component
- UI Integration Tests
- Core Async Status & Types
- Architecture & Tooling Rationale
- Design System & Search Symbols
- Server Content Availability
- Home Shell & Tab Navigation
- App Lifecycle & Root View
- Library Feature & ViewModel
- Unit Tests & Test Suite
- API Package Definition
- SwiftLint Configuration

## God Nodes (most connected - your core abstractions)
1. `ApolloAPI` - 44 edges
2. `Node` - 18 edges
3. `Book` - 17 edges
4. `Node` - 16 edges
5. `Chapters` - 15 edges
6. `Objects` - 15 edges
7. `AsyncStatus` - 15 edges
8. `MangaChaptersQuery` - 14 edges
9. `AddServerSheetViewModel` - 14 edges
10. `Node` - 13 edges

## Surprising Connections (you probably didn't know these)
- `OnboardingView` --calls--> `OnboardingViewModel`  [INFERRED]
  Tsugi/Features/Onboarding/OnboardingView.swift → Tsugi/Features/Onboarding/OnboardingViewModel.swift
- `.body` --calls--> `HomeShellView`  [INFERRED]
  Tsugi/App/Navigation/RootView.swift → Tsugi/App/Navigation/HomeShellView.swift
- `.body` --calls--> `DiscoverView`  [INFERRED]
  Tsugi/App/Navigation/HomeShellView.swift → Tsugi/Features/Discover/DiscoverView.swift
- `.body` --calls--> `LibraryView`  [INFERRED]
  Tsugi/App/Navigation/HomeShellView.swift → Tsugi/Features/Library/LibraryView.swift
- `RootView` --calls--> `RouteCoordinator`  [INFERRED]
  Tsugi/App/Navigation/RootView.swift → Tsugi/App/Navigation/RouteCoordinator.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Tsugi Core Architecture Components** — readme_serverconfig, readme_urlscheme, readme_serverstorage, readme_serverhealthservice [EXTRACTED 1.00]
- **Tsugi High-Level Subsystems** — readme_tsugi_core, readme_tsugi_features, readme_tsugi_tests [EXTRACTED 1.00]
- **Code Quality and Formatting Tools** — swiftlint_config, readme_swiftlint, readme_swiftformat [INFERRED 0.85]

## Communities (22 total, 4 thin omitted)

### Community 0 - "Apollo Client & Book Covers"
Cohesion: 0.07
Nodes (20): Apollo, BookCoverView, .body, .resolveThumbnail, Book, BookChapter, BookDetails, Source (+12 more)

### Community 1 - "Suwayomi GraphQL Chapters"
Cohesion: 0.07
Nodes (28): Chapters, .__fulfilledFragments, .nodes, .pageInfo, .__parentType, .__selections, .totalCount, Data (+20 more)

### Community 2 - "Manga Details Queries"
Cohesion: 0.06
Nodes (23): Data, .__fulfilledFragments, .mangas, .__parentType, .__selections, MangaDetailsQuery, .__variables, Mangas (+15 more)

### Community 3 - "Chapter Queries & Cursors"
Cohesion: 0.07
Nodes (24): MangaChaptersQuery, .__variables, MangaStatus, cancelled, completed, licensed, ongoing, onHiatus (+16 more)

### Community 4 - "GraphQL Schema & Node Lists"
Cohesion: 0.11
Nodes (10): ApolloAPI, SchemaConfiguration, InlineFragment, Interfaces, MutableInlineFragment, MutableSelectionSet, Objects, SchemaMetadata (+2 more)

### Community 5 - "Manga List Queries"
Cohesion: 0.08
Nodes (19): Data, .__fulfilledFragments, .mangas, .__parentType, .__selections, MangaListQuery, .__variables, Mangas (+11 more)

### Community 6 - "Onboarding & Privacy Flow"
Cohesion: 0.09
Nodes (17): OnboardingView, .content, PrivacyView, .body, WelcomeView, .body, AddServerSheetView, .body (+9 more)

### Community 7 - "App Routing & Navigation"
Cohesion: 0.10
Nodes (19): Alert, error, .id, reset, Destination, bookDetails, FullScreenCover, .id (+11 more)

### Community 8 - "Preferences & Core Storage"
Cohesion: 0.12
Nodes (6): Foundation, Observation, .body, AppPreferences, ServerStorage, SettingsView

### Community 9 - "Layout & Grid System"
Cohesion: 0.11
Nodes (13): Column, .items, three, two, GridLayout, .body, OnboardingStep, privacy (+5 more)

### Community 10 - "Scrollable Grid Surface Component"
Cohesion: 0.12
Nodes (8): ScrollableGridSurfaceView, .body, ScrollDirection, horizontal, vertical, AnyTransition, .slidingBlurReplace, SlidingBlurReplaceTransition

### Community 11 - "UI Integration Tests"
Cohesion: 0.15
Nodes (4): TsugiUiTests, TsugiUiTestsLaunchTests, .runsForEachTargetApplicationUIConfiguration, XCTest

### Community 12 - "Core Async Status & Types"
Cohesion: 0.15
Nodes (10): AsyncStatus, failure, .failureMessage, idle, .isFailure, .isIdle, .isLoading, .isSuccess (+2 more)

### Community 13 - "Architecture & Tooling Rationale"
Cohesion: 0.24
Nodes (11): ServerConfig Model, ServerHealthService, ServerStorage Persistence, Suwayomi Server, SwiftFormat Tool, SwiftLint Tool, Tsugi iOS Client, Tsugi Core Architecture (+3 more)

### Community 14 - "Design System & Search Symbols"
Cohesion: 0.22
Nodes (5): os, SwiftUI, SFSymbol, SearchView, .body

### Community 15 - "Server Content Availability"
Cohesion: 0.25
Nodes (4): ServerContentView, .isServerConfigured, DiscoverView, .body

### Community 16 - "Home Shell & Tab Navigation"
Cohesion: 0.29
Nodes (6): HomeShellView, .body, ShellTab, discover, library, search

### Community 17 - "App Lifecycle & Root View"
Cohesion: 0.29
Nodes (3): RootView, TsugiApp, .body

## Knowledge Gaps
- **134 isolated node(s):** `SFSymbol`, `.body`, `.body`, `.body`, `Testing` (+129 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 181 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApolloAPI` connect `GraphQL Schema & Node Lists` to `Suwayomi GraphQL Chapters`, `Manga Details Queries`, `Chapter Queries & Cursors`, `Manga List Queries`?**
  _High betweenness centrality (0.213) - this node is a cross-community bridge._
- **What connects `SFSymbol`, `.body`, `.body` to the rest of the system?**
  _134 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Apollo Client & Book Covers` be split into smaller, more focused modules?**
  _Cohesion score 0.06848357791754019 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `Design System & Search Symbols` to `Apollo Client & Book Covers`, `Onboarding & Privacy Flow`, `App Routing & Navigation`, `Preferences & Core Storage`, `Layout & Grid System`, `Scrollable Grid Surface Component`, `Server Content Availability`, `Home Shell & Tab Navigation`, `App Lifecycle & Root View`, `Library Feature & ViewModel`?**
  _High betweenness centrality (0.195) - this node is a cross-community bridge._
- **Should `Suwayomi GraphQL Chapters` be split into smaller, more focused modules?**
  _Cohesion score 0.06612685560053981 - nodes in this community are weakly interconnected._
- **Why does `DefaultMangaService` connect `Apollo Client & Book Covers` to `Preferences & Core Storage`, `Library Feature & ViewModel`?**
  _High betweenness centrality (0.095) - this node is a cross-community bridge._
- **Should `Manga Details Queries` be split into smaller, more focused modules?**
  _Cohesion score 0.06401137980085349 - nodes in this community are weakly interconnected._