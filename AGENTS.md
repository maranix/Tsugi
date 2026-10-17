# AGENTS.md

Instructions, conventions, and operational guidelines for AI coding agents working on **Tsugi**.

---

## 1. Core Principles & Philosophy

* **Language & Runtime**: Swift 6.0, SwiftUI, modern concurrency (`async`/`await`, actors, `@Observable`), iOS 26.0+.
* **Backend Interop**: Apollo iOS with Suwayomi GraphQL API.
* **Surgical Edits**: Keep changes minimal, clean, and focused on the task.
* **Code Style**: Follow standard architectural practices and idomatic Swift Code Style. Apple suggested or mostl commonly/widely used in the industry.

---

## 2. Diagnostics & Build Discipline

> [!IMPORTANT]
> **Do NOT run `xcodebuild` in a feedback loop or multiple times.**
> `xcodebuild` is computationally expensive and slow. Never use it as a syntax checker or linter.

### Fast Diagnostics via Linters (Preferred)
Always use static analysis tools for syntax verification, linting, and formatting checks:

```bash
# Check formatting without modifying files
swiftformat . --lint

# Automatically format modified files (excluding SuwayomiAPI)
swiftformat .

# Run SwiftLint for diagnostic warnings and errors
swiftlint lint --strict
```

### When to Run Builds
* **Only run `xcodebuild` when absolutely necessary** (e.g., verifying a newly introduced Apollo schema/package change, complex Swift 6 concurrency edge-case, or prior to final release).
* **Never run consecutive or redundant builds**. If a build is needed, verify errors mentally and with `swiftlint` first before attempting a single build invocation.

---

## 3. Git & Atomic Commits

> [!IMPORTANT]
> **Always make atomic commits.** Every commit must represent a single logical change that compiles and makes sense on its own.

### Commit Guidelines
* **Granular & Layered**:
  * Separate GraphQL operations/codegen changes from domain models and services.
  * Separate business logic/services from UI views.
  * Separate config/tooling adjustments from feature code.
* **Conventional Commits**:
  * `feat(scope)`: New user-facing or architectural functionality (e.g. `feat(server): implement ServerView`).
  * `fix(scope)`: Bug fixes (e.g. `fix(library): handle pagination offset correctly`).
  * `chore(scope)`: Configuration, build tooling, or dependencies (e.g. `chore(config): update SwiftLint rules`).
  * `refactor(scope)`: Code refactoring without behavioral changes.
  * `style(scope)`: Formatting, whitespace, or lint cleanups.
* **Never batch unrelated changes** into a single mega-commit.

---

## 4. Architecture & Coding Conventions

### Project Structure
* `SuwayomiAPI/`: Apollo GraphQL operations, fragments, and generated code. Do not manually edit files marked `// @generated`.
* `Tsugi/Core/`:
  * `Models/`: Immutable domain models conforming to `Hashable` and `Sendable`.
  * `Services/`: Actor-based or protocol-oriented service layer.
  * `SuwayomiAPI+Extensions.swift`: Clean extension mappers converting GraphQL fragments/payloads into domain structs.
  * `DesignSystem/`: Shared design tokens, SF Symbols (`SFSymbol`), and layout metrics.
  * `Storage/`: Local persistence (`AppPreferences`, `UserDefaults`).
* `Tsugi/Features/`: Feature modules containing Views and `@Observable` ViewModels.
* `Tsugi/Components/`: Reusable components (e.g. `ServerContentView`).

### Concurrency & State
* Actor is set to `nonisolated` by default to minimize main thread blocking and maximize Swift Concurrency usage.
* Use `@Observable` classes marked with `@MainActor` for ViewModels.
* Ensure all models passed across actor boundaries conform to `Sendable`.
* Wrap server-dependent views with `ServerContentView` to automatically present fallback states when no server is connected.
* Obey the 120-character line length limit defined in `.swiftlint.yml`.
