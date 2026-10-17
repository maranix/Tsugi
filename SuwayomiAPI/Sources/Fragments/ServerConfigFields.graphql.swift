// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ServerConfigFields: SuwayomiAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment ServerConfigFields on SettingsType { __typename globalUpdateInterval autoDownloadNewChapters autoDownloadNewChaptersLimit autoDownloadIgnoreReUploads maxSourcesInParallel excludeCompleted excludeNotStarted downloadAsCbz downloadsPath localSourcePath backupPath flareSolverrEnabled flareSolverrUrl flareSolverrTimeout backupInterval backupTTL autoBackupIncludeCategories autoBackupIncludeManga autoBackupIncludeTracking }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.SettingsType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("globalUpdateInterval", Double.self),
    .field("autoDownloadNewChapters", Bool.self),
    .field("autoDownloadNewChaptersLimit", Int.self),
    .field("autoDownloadIgnoreReUploads", Bool.self),
    .field("maxSourcesInParallel", Int.self),
    .field("excludeCompleted", Bool.self),
    .field("excludeNotStarted", Bool.self),
    .field("downloadAsCbz", Bool.self),
    .field("downloadsPath", String.self),
    .field("localSourcePath", String.self),
    .field("backupPath", String.self),
    .field("flareSolverrEnabled", Bool.self),
    .field("flareSolverrUrl", String.self),
    .field("flareSolverrTimeout", Int.self),
    .field("backupInterval", Int.self),
    .field("backupTTL", Int.self),
    .field("autoBackupIncludeCategories", Bool.self),
    .field("autoBackupIncludeManga", Bool.self),
    .field("autoBackupIncludeTracking", Bool.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    ServerConfigFields.self
  ] }

  public var globalUpdateInterval: Double { __data["globalUpdateInterval"] }
  public var autoDownloadNewChapters: Bool { __data["autoDownloadNewChapters"] }
  public var autoDownloadNewChaptersLimit: Int { __data["autoDownloadNewChaptersLimit"] }
  public var autoDownloadIgnoreReUploads: Bool { __data["autoDownloadIgnoreReUploads"] }
  public var maxSourcesInParallel: Int { __data["maxSourcesInParallel"] }
  public var excludeCompleted: Bool { __data["excludeCompleted"] }
  public var excludeNotStarted: Bool { __data["excludeNotStarted"] }
  public var downloadAsCbz: Bool { __data["downloadAsCbz"] }
  public var downloadsPath: String { __data["downloadsPath"] }
  public var localSourcePath: String { __data["localSourcePath"] }
  public var backupPath: String { __data["backupPath"] }
  public var flareSolverrEnabled: Bool { __data["flareSolverrEnabled"] }
  public var flareSolverrUrl: String { __data["flareSolverrUrl"] }
  public var flareSolverrTimeout: Int { __data["flareSolverrTimeout"] }
  public var backupInterval: Int { __data["backupInterval"] }
  public var backupTTL: Int { __data["backupTTL"] }
  public var autoBackupIncludeCategories: Bool { __data["autoBackupIncludeCategories"] }
  public var autoBackupIncludeManga: Bool { __data["autoBackupIncludeManga"] }
  public var autoBackupIncludeTracking: Bool { __data["autoBackupIncludeTracking"] }
}
