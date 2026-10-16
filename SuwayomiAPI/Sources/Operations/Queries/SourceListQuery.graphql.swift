// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct SourceListQuery: GraphQLQuery {
  public static let operationName: String = "SourceList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SourceList($first: Int! = 20, $orderBy: SourceOrderBy! = ID, $orderType: SortOrder! = ASC, $after: Cursor) { sources( first: $first after: $after order: { by: $orderBy, byType: $orderType } ) { __typename totalCount pageInfo { __typename hasNextPage startCursor endCursor } nodes { __typename id name displayName iconUrl homeUrl lang supportsLatest contentWarning isConfigurable } } }"#
    ))

  public var first: Int32
  public var orderBy: GraphQLEnum<SourceOrderBy>
  public var orderType: GraphQLEnum<SortOrder>
  public var after: GraphQLNullable<Cursor>

  public init(
    first: Int32 = 20,
    orderBy: GraphQLEnum<SourceOrderBy> = .init(.id),
    orderType: GraphQLEnum<SortOrder> = .init(.asc),
    after: GraphQLNullable<Cursor>
  ) {
    self.first = first
    self.orderBy = orderBy
    self.orderType = orderType
    self.after = after
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "first": first,
    "orderBy": orderBy,
    "orderType": orderType,
    "after": after
  ] }

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("sources", Sources.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after"),
        "order": [
          "by": .variable("orderBy"),
          "byType": .variable("orderType")
        ]
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      SourceListQuery.Data.self
    ] }

    public var sources: Sources { __data["sources"] }

    /// Sources
    ///
    /// Parent Type: `SourceNodeList`
    nonisolated public struct Sources: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.SourceNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("totalCount", Int.self),
        .field("pageInfo", PageInfo.self),
        .field("nodes", [Node].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        SourceListQuery.Data.Sources.self
      ] }

      public var totalCount: Int { __data["totalCount"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }
      public var nodes: [Node] { __data["nodes"] }

      /// Sources.PageInfo
      ///
      /// Parent Type: `PageInfo`
      nonisolated public struct PageInfo: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.PageInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("hasNextPage", Bool.self),
          .field("startCursor", SuwayomiAPI.Cursor?.self),
          .field("endCursor", SuwayomiAPI.Cursor?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          SourceListQuery.Data.Sources.PageInfo.self
        ] }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool { __data["hasNextPage"] }
        /// When paginating backwards, the cursor to continue.
        public var startCursor: SuwayomiAPI.Cursor? { __data["startCursor"] }
        /// When paginating forwards, the cursor to continue.
        public var endCursor: SuwayomiAPI.Cursor? { __data["endCursor"] }
      }

      /// Sources.Node
      ///
      /// Parent Type: `SourceType`
      nonisolated public struct Node: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.SourceType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", SuwayomiAPI.LongString.self),
          .field("name", String.self),
          .field("displayName", String.self),
          .field("iconUrl", String.self),
          .field("homeUrl", String?.self),
          .field("lang", String.self),
          .field("supportsLatest", Bool.self),
          .field("contentWarning", GraphQLEnum<SuwayomiAPI.ContentWarning>.self),
          .field("isConfigurable", Bool.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          SourceListQuery.Data.Sources.Node.self
        ] }

        public var id: SuwayomiAPI.LongString { __data["id"] }
        public var name: String { __data["name"] }
        public var displayName: String { __data["displayName"] }
        public var iconUrl: String { __data["iconUrl"] }
        public var homeUrl: String? { __data["homeUrl"] }
        public var lang: String { __data["lang"] }
        public var supportsLatest: Bool { __data["supportsLatest"] }
        public var contentWarning: GraphQLEnum<SuwayomiAPI.ContentWarning> { __data["contentWarning"] }
        public var isConfigurable: Bool { __data["isConfigurable"] }
      }
    }
  }
}
