// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ServerDashboardQuery: GraphQLQuery {
  public static let operationName: String = "ServerDashboard"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ServerDashboard { aboutServer { __typename ...ServerInfoFields } settings { __typename ...ServerConfigFields } }"#,
      fragments: [ServerConfigFields.self, ServerInfoFields.self]
    ))

  public init() {}

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("aboutServer", AboutServer.self),
      .field("settings", Settings.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ServerDashboardQuery.Data.self
    ] }

    public var aboutServer: AboutServer { __data["aboutServer"] }
    public var settings: Settings { __data["settings"] }

    /// AboutServer
    ///
    /// Parent Type: `AboutServerPayload`
    nonisolated public struct AboutServer: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.AboutServerPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(ServerInfoFields.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ServerDashboardQuery.Data.AboutServer.self,
        ServerInfoFields.self
      ] }

      public var name: String { __data["name"] }
      public var version: String { __data["version"] }
      public var buildType: String { __data["buildType"] }
      public var buildTime: SuwayomiAPI.LongString { __data["buildTime"] }
      public var github: String { __data["github"] }
      public var discord: String { __data["discord"] }
      public var platformInfo: PlatformInfo { __data["platformInfo"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var serverInfoFields: ServerInfoFields { _toFragment() }
      }

      public typealias PlatformInfo = ServerInfoFields.PlatformInfo
    }

    /// Settings
    ///
    /// Parent Type: `SettingsType`
    nonisolated public struct Settings: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.SettingsType }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(ServerConfigFields.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ServerDashboardQuery.Data.Settings.self,
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

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var serverConfigFields: ServerConfigFields { _toFragment() }
      }
    }
  }
}
