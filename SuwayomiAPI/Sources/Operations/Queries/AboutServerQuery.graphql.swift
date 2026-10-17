// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct AboutServerQuery: GraphQLQuery {
  public static let operationName: String = "AboutServer"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AboutServer { aboutServer { __typename name github discord buildType buildTime version platformInfo { __typename arch headless os { __typename build name version } jvm { __typename javaVersion vmName vmVendor vmVersion } } } }"#
    ))

  public init() {}

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("aboutServer", AboutServer.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      AboutServerQuery.Data.self
    ] }

    public var aboutServer: AboutServer { __data["aboutServer"] }

    /// AboutServer
    ///
    /// Parent Type: `AboutServerPayload`
    nonisolated public struct AboutServer: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.AboutServerPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("github", String.self),
        .field("discord", String.self),
        .field("buildType", String.self),
        .field("buildTime", SuwayomiAPI.LongString.self),
        .field("version", String.self),
        .field("platformInfo", PlatformInfo.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        AboutServerQuery.Data.AboutServer.self
      ] }

      public var name: String { __data["name"] }
      public var github: String { __data["github"] }
      public var discord: String { __data["discord"] }
      public var buildType: String { __data["buildType"] }
      public var buildTime: SuwayomiAPI.LongString { __data["buildTime"] }
      public var version: String { __data["version"] }
      public var platformInfo: PlatformInfo { __data["platformInfo"] }

      /// AboutServer.PlatformInfo
      ///
      /// Parent Type: `PlatformInfo`
      nonisolated public struct PlatformInfo: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.PlatformInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("arch", String.self),
          .field("headless", Bool.self),
          .field("os", Os.self),
          .field("jvm", Jvm.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          AboutServerQuery.Data.AboutServer.PlatformInfo.self
        ] }

        public var arch: String { __data["arch"] }
        public var headless: Bool { __data["headless"] }
        public var os: Os { __data["os"] }
        public var jvm: Jvm { __data["jvm"] }

        /// AboutServer.PlatformInfo.Os
        ///
        /// Parent Type: `OSInfo`
        nonisolated public struct Os: SuwayomiAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.OSInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("build", String?.self),
            .field("name", String.self),
            .field("version", String.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            AboutServerQuery.Data.AboutServer.PlatformInfo.Os.self
          ] }

          public var build: String? { __data["build"] }
          public var name: String { __data["name"] }
          public var version: String { __data["version"] }
        }

        /// AboutServer.PlatformInfo.Jvm
        ///
        /// Parent Type: `JvmInfo`
        nonisolated public struct Jvm: SuwayomiAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.JvmInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("javaVersion", String.self),
            .field("vmName", String.self),
            .field("vmVendor", String.self),
            .field("vmVersion", String.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            AboutServerQuery.Data.AboutServer.PlatformInfo.Jvm.self
          ] }

          public var javaVersion: String { __data["javaVersion"] }
          public var vmName: String { __data["vmName"] }
          public var vmVendor: String { __data["vmVendor"] }
          public var vmVersion: String { __data["vmVersion"] }
        }
      }
    }
  }
}
