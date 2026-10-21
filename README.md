# Tsugi (次)

Tsugi is a modern native iOS client for self-hosted [Suwayomi](https://github.com/Suwayomi/Suwayomi-Server) manga servers, built with Swift 6, SwiftUI, and modern concurrency.

> **Status:** early development. The app is being rebuilt from scratch, so the repository is not buildable yet.

## Requirements

- **iOS 26.0+**
- **Xcode 26+** (Swift 6 toolchain)

## Project Structure

TBD — documented as the rewrite lands. Planned layout:

- `GraphQL/` — Suwayomi schema and operation documents
- `Packages/TsugiKit/` — core domain, API, design system, reader
- `Tsugi/` — app target
- `Tests/` — unit tests

## Getting Started

1. Clone the repository:
   ```sh
   git clone https://github.com/maranix/Tsugi.git
   cd Tsugi
   ```
2. There is no Xcode project yet. Once it lands, open the generated `Tsugi.xcodeproj` and run on a simulator or device.

## Formatting

Formatting and linting use `swift-format`, which ships with the Swift toolchain:

```sh
# Format in place
swift format --in-place --recursive Tsugi Packages Tests

# Check without modifying (non-zero exit on violations)
swift format lint --strict --recursive Tsugi Packages Tests
```

Configuration lives in [`.swift-format`](.swift-format).

## License

MIT — see [LICENSE](LICENSE).
