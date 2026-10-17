import Foundation

struct ServerPlatform: Hashable, Sendable {
    struct Os: Hashable, Sendable {
        let name: String
        let version: String
    }

    struct Jvm: Hashable, Sendable {
        let vmName: String
        let javaVersion: String
    }

    let arch: String
    let headless: Bool
    let osInfo: Os
    let jvmInfo: Jvm
}

struct ServerInfo: Hashable, Sendable {
    let name: String
    let github: URL
    let discord: URL
    let buildType: String
    let buildTime: String
    let version: String
    let platform: ServerPlatform
}

struct ServerSettings: Hashable, Sendable {
    var library: Library
    var downloads: Downloads
    var storage: Storage
    var flareSolverr: FlareSolverr
    var backup: Backup

    struct Library: Hashable, Sendable {
        var globalUpdateIntervalHrs: Double // In hours
        var maxSourcesInParallel: Int
        var excludeCompleted: Bool
        var excludeNotStarted: Bool
    }

    struct Downloads: Hashable, Sendable {
        var autoDownloadNewChapters: Bool
        var autoDownloadNewChaptersLimit: Int
        var autoDownloadIgnoreReUploads: Bool
        var downloadAsCbz: Bool
    }

    struct Storage: Hashable, Sendable {
        let downloadsPath: String
        let localSourcePath: String
        let backupPath: String
    }

    struct FlareSolverr: Hashable, Sendable {
        var enabled: Bool
        var url: String
        var timeout: Int
    }

    struct Backup: Hashable, Sendable {
        var intervalHrs: Int
        var ttl: Int // Max backups to keep
        var includeCategories: Bool
        var includeManga: Bool
        var includeTracking: Bool
    }
}

struct ServerDashboard: Hashable, Sendable {
    let about: ServerInfo
    var settings: ServerSettings
}
