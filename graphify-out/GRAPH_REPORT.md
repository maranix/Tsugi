# Graph Report - Tsugi  (2026-10-10)

## Corpus Check
- Corpus is ~2,939 words - fits in a single context window. You may not need a graph.

## Summary
- 203 nodes · 291 edges · 14 communities (13 shown, 1 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 33 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Onboarding Views and UI
- App Entry and Home Shell
- Async State Management
- Server Configuration Models
- Navigation and App Routing
- Modal Sheet Presentation
- UI Automation Tests
- Onboarding ViewModel and Flow
- Architecture and Quality Tooling
- Server Health Service
- UI Transitions and Animations
- Onboarding Persistence Storage
- Unit Tests Suite
- UserDefaults Storage Keys

## God Nodes (most connected - your core abstractions)
1. `AsyncStatus` - 12 edges
2. `URLScheme` - 11 edges
3. `DefaultServerStore` - 11 edges
4. `AddServerSheetViewModel` - 11 edges
5. `OnboardingViewModel` - 10 edges
6. `AppRoute` - 9 edges
7. `DefaultOnboardingStore` - 9 edges
8. `Sheet` - 8 edges
9. `ServerConfig` - 8 edges
10. `OnboardingView` - 8 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `HomeShellView`  [INFERRED]
  Tsugi/App/Navigation/RootView.swift → Tsugi/App/Navigation/HomeShellView.swift
- `RootView` --calls--> `MainRouter`  [INFERRED]
  Tsugi/App/Navigation/RootView.swift → Tsugi/App/Navigation/Router.swift
- `.body` --calls--> `RootView`  [INFERRED]
  Tsugi/App/TsugiApp.swift → Tsugi/App/Navigation/RootView.swift
- `.body` --references--> `AppRoute`  [EXTRACTED]
  Tsugi/Features/Discover/DiscoverView.swift → Tsugi/App/Navigation/Router.swift
- `OnboardingView` --calls--> `OnboardingViewModel`  [INFERRED]
  Tsugi/Features/Onboarding/OnboardingView.swift → Tsugi/Features/Onboarding/OnboardingViewModel.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Tsugi Core Architecture Components** — readme_serverconfig, readme_urlscheme, readme_serverstorage, readme_serverhealthservice [EXTRACTED 1.00]
- **Tsugi High-Level Subsystems** — readme_tsugi_core, readme_tsugi_features, readme_tsugi_tests [EXTRACTED 1.00]
- **Code Quality and Formatting Tools** — _swiftlint_config, readme_swiftlint, readme_swiftformat [INFERRED 0.85]

## Communities (14 total, 1 thin omitted)

### Community 0 - "Onboarding Views and UI"
Cohesion: 0.11
Nodes (17): .body, OnboardingView, .content, PrivacyView, .body, WelcomeView, .body, AddServerSheetView (+9 more)

### Community 1 - "App Entry and Home Shell"
Cohesion: 0.09
Nodes (16): SwiftUI, HomeShellView, .body, ShellTab, discover, library, search, RootView (+8 more)

### Community 2 - "Async State Management"
Cohesion: 0.10
Nodes (14): os, AsyncStatus, failure, .failureMessage, idle, .isFailure, .isLoading, .isSuccess (+6 more)

### Community 3 - "Server Configuration Models"
Cohesion: 0.16
Nodes (5): Foundation, ServerConfig, DefaultServerStore, .isConfigured, ServerStorage

### Community 4 - "Navigation and App Routing"
Cohesion: 0.17
Nodes (10): AppRoute, Destination, item, Main, homeShell, splash, MainRouter, NavigationRouter (+2 more)

### Community 5 - "Modal Sheet Presentation"
Cohesion: 0.14
Nodes (11): Sheet, addServer, .id, onboarding, settings, URLScheme, .displayName, http (+3 more)

### Community 6 - "UI Automation Tests"
Cohesion: 0.15
Nodes (4): TsugiUiTests, TsugiUiTestsLaunchTests, .runsForEachTargetApplicationUIConfiguration, XCTest

### Community 7 - "Onboarding ViewModel and Flow"
Cohesion: 0.19
Nodes (8): .body, OnboardingStep, privacy, welcome, OnboardingViewModel, .canGoNext, .canGoPrevious, .currentStep

### Community 8 - "Architecture and Quality Tooling"
Cohesion: 0.21
Nodes (12): SwiftLint Configuration, ServerConfig Model, ServerHealthService, ServerStorage Persistence, Suwayomi Server, SwiftFormat Tool, SwiftLint Tool, Tsugi iOS Client (+4 more)

### Community 9 - "Server Health Service"
Cohesion: 0.27
Nodes (3): EnvironmentValues, DefaultServerHealthService, ServerHealthService

### Community 10 - "UI Transitions and Animations"
Cohesion: 0.22
Nodes (3): AnyTransition, .slidingBlurReplace, SlidingBlurReplaceTransition

### Community 11 - "Onboarding Persistence Storage"
Cohesion: 0.36
Nodes (3): DefaultOnboardingStore, .onboarded, OnboardingStorage

### Community 13 - "UserDefaults Storage Keys"
Cohesion: 0.50
Nodes (3): Onboarding, Server, StorageKey

## Knowledge Gaps
- **48 isolated node(s):** `library`, `discover`, `search`, `splash`, `homeShell` (+43 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 78 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `SwiftUI` connect `App Entry and Home Shell` to `Onboarding Views and UI`, `Async State Management`, `Navigation and App Routing`, `Onboarding ViewModel and Flow`, `UI Transitions and Animations`, `Onboarding Persistence Storage`?**
  _High betweenness centrality (0.285) - this node is a cross-community bridge._
- **What connects `library`, `discover`, `search` to the rest of the system?**
  _48 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Onboarding Views and UI` be split into smaller, more focused modules?**
  _Cohesion score 0.11396011396011396 - nodes in this community are weakly interconnected._
- **Why does `AddServerSheetViewModel` connect `Async State Management` to `Onboarding Views and UI`, `Server Configuration Models`, `Modal Sheet Presentation`?**
  _High betweenness centrality (0.207) - this node is a cross-community bridge._
- **Should `App Entry and Home Shell` be split into smaller, more focused modules?**
  _Cohesion score 0.09230769230769231 - nodes in this community are weakly interconnected._
- **Why does `URLScheme` connect `Modal Sheet Presentation` to `Async State Management`, `Server Configuration Models`?**
  _High betweenness centrality (0.113) - this node is a cross-community bridge._
- **Should `Async State Management` be split into smaller, more focused modules?**
  _Cohesion score 0.09523809523809523 - nodes in this community are weakly interconnected._