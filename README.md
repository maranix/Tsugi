# Tsugi (次)

Tsugi is a modern native iOS client for self-hosted [Suwayomi](https://github.com/Suwayomi/Suwayomi-Server) manga servers, built using Swift 6, SwiftUI, and modern concurrency.

## Requirements

- **iOS 26.0+**
- **Xcode 26+**
- **Swift 6.0**

## Project Architecture

- **`Tsugi/Core`**:
  - `Models/`: Data structures such as `ServerConfig`, `URLScheme`.
  - `Storage/`: Persistence layer (`ServerStorage` using `UserDefaults`).
  - `Services/`: Networking and background services (`ServerHealthService`).
  - `DesignSystem/`: Shared symbols, navigation transitions, and environment values.
- **`Tsugi/Features`**:
  - `Onboarding/`: Welcome and privacy onboarding flows.
  - `ServerSetup/`: Server configuration, connection test, and health check sheet.
  - `Discover/`: Manga exploration and browsing.
  - `Library/`: User collection and saved titles.
- **Tests**:
  - `TsugiUnitTests/`: Swift Testing test suite.
  - `TsugiUiTests/`: XCTest UI test suite.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/maranix/Tsugi.git
   cd Tsugi
   ```
2. Open `Tsugi.xcodeproj` in Xcode.
3. (Optional) Configure your Apple Developer Team for code signing by creating `Config/Local.xcconfig`:
   ```xcconfig
   DEVELOPMENT_TEAM = <YOUR_TEAM_ID>
   ```
4. Build and run the app on the simulator or a physical device.

## Code Quality & Formatting

The codebase uses [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) and [SwiftLint](https://github.com/realm/SwiftLint) to maintain quality and formatting consistency.

> **Note**: These tools are not bundled with the source code or managed as project packages. They need to be installed and managed manually (e.g. via Homebrew or Mint) to ensure coding standards are met before contributing.

- Check formatting:
  ```bash
  swiftformat . --lint
  ```
- Run linter:
  ```bash
  swiftlint lint --strict
  ```

## License

Private / All rights reserved.
