// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ServerInfoFields: SuwayomiAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment ServerInfoFields on AboutServerPayload { __typename name version buildType buildTime github discord platformInfo { __typename arch headless os { __typename name version } jvm { __typename javaVersion vmName } } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.AboutServerPayload }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("name", String.self),
    .field("version", String.self),
    .field("buildType", String.self),
    .field("buildTime", SuwayomiAPI.LongString.self),
    .field("github", String.self),
    .field("discord", String.self),
    .field("platformInfo", PlatformInfo.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    ServerInfoFields.self
  ] }

  public var name: String { __data["name"] }
  public var version: String { __data["version"] }
  public var buildType: String { __data["buildType"] }
  public var buildTime: SuwayomiAPI.LongString { __data["buildTime"] }
  public var github: String { __data["github"] }
  public var discord: String { __data["discord"] }
  public var platformInfo: PlatformInfo { __data["platformInfo"] }

  /// PlatformInfo
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
      ServerInfoFields.PlatformInfo.self
    ] }

    public var arch: String { __data["arch"] }
    public var headless: Bool { __data["headless"] }
    public var os: Os { __data["os"] }
    public var jvm: Jvm { __data["jvm"] }

    /// PlatformInfo.Os
    ///
    /// Parent Type: `OSInfo`
    nonisolated public struct Os: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.OSInfo }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("version", String.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ServerInfoFields.PlatformInfo.Os.self
      ] }

      public var name: String { __data["name"] }
      public var version: String { __data["version"] }
    }

    /// PlatformInfo.Jvm
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
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ServerInfoFields.PlatformInfo.Jvm.self
      ] }

      public var javaVersion: String { __data["javaVersion"] }
      public var vmName: String { __data["vmName"] }
    }
  }
}
