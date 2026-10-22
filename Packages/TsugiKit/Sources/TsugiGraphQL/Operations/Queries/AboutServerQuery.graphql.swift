// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct AboutServerQuery: GraphQLQuery {
  public static let operationName: String = "AboutServer"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AboutServer { aboutServer { __typename name version buildTime buildType github discord platformInfo { __typename headless arch os { __typename name version } jvm { __typename vmName javaVersion } } } }"#
    ))

  public init() {}

  nonisolated public struct Data: TsugiGraphQL.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { TsugiGraphQL.Objects.Query }
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
    nonisolated public struct AboutServer: TsugiGraphQL.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { TsugiGraphQL.Objects.AboutServerPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("version", String.self),
        .field("buildTime", TsugiGraphQL.LongString.self),
        .field("buildType", String.self),
        .field("github", String.self),
        .field("discord", String.self),
        .field("platformInfo", PlatformInfo.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        AboutServerQuery.Data.AboutServer.self
      ] }

      public var name: String { __data["name"] }
      public var version: String { __data["version"] }
      public var buildTime: TsugiGraphQL.LongString { __data["buildTime"] }
      public var buildType: String { __data["buildType"] }
      public var github: String { __data["github"] }
      public var discord: String { __data["discord"] }
      public var platformInfo: PlatformInfo { __data["platformInfo"] }

      /// AboutServer.PlatformInfo
      ///
      /// Parent Type: `PlatformInfo`
      nonisolated public struct PlatformInfo: TsugiGraphQL.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { TsugiGraphQL.Objects.PlatformInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("headless", Bool.self),
          .field("arch", String.self),
          .field("os", Os.self),
          .field("jvm", Jvm.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          AboutServerQuery.Data.AboutServer.PlatformInfo.self
        ] }

        public var headless: Bool { __data["headless"] }
        public var arch: String { __data["arch"] }
        public var os: Os { __data["os"] }
        public var jvm: Jvm { __data["jvm"] }

        /// AboutServer.PlatformInfo.Os
        ///
        /// Parent Type: `OSInfo`
        nonisolated public struct Os: TsugiGraphQL.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { TsugiGraphQL.Objects.OSInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("version", String.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            AboutServerQuery.Data.AboutServer.PlatformInfo.Os.self
          ] }

          public var name: String { __data["name"] }
          public var version: String { __data["version"] }
        }

        /// AboutServer.PlatformInfo.Jvm
        ///
        /// Parent Type: `JvmInfo`
        nonisolated public struct Jvm: TsugiGraphQL.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { TsugiGraphQL.Objects.JvmInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("vmName", String.self),
            .field("javaVersion", String.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            AboutServerQuery.Data.AboutServer.PlatformInfo.Jvm.self
          ] }

          public var vmName: String { __data["vmName"] }
          public var javaVersion: String { __data["javaVersion"] }
        }
      }
    }
  }
}
