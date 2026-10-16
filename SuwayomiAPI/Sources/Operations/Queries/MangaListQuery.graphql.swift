// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MangaListQuery: GraphQLQuery {
  public static let operationName: String = "MangaList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MangaList($inLibrary: Boolean!, $first: Int!, $orderBy: MangaOrderBy!, $orderType: SortOrder!, $after: Cursor) { mangas( first: $first after: $after condition: { inLibrary: $inLibrary } order: [{ by: $orderBy, byType: $orderType }] ) { __typename totalCount pageInfo { __typename startCursor endCursor hasNextPage } nodes { __typename id title thumbnailUrl } } }"#
    ))

  public var inLibrary: Bool
  public var first: Int32
  public var orderBy: GraphQLEnum<MangaOrderBy>
  public var orderType: GraphQLEnum<SortOrder>
  public var after: GraphQLNullable<Cursor>

  public init(
    inLibrary: Bool,
    first: Int32,
    orderBy: GraphQLEnum<MangaOrderBy>,
    orderType: GraphQLEnum<SortOrder>,
    after: GraphQLNullable<Cursor>
  ) {
    self.inLibrary = inLibrary
    self.first = first
    self.orderBy = orderBy
    self.orderType = orderType
    self.after = after
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "inLibrary": inLibrary,
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
      .field("mangas", Mangas.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after"),
        "condition": ["inLibrary": .variable("inLibrary")],
        "order": [[
          "by": .variable("orderBy"),
          "byType": .variable("orderType")
        ]]
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      MangaListQuery.Data.self
    ] }

    public var mangas: Mangas { __data["mangas"] }

    /// Mangas
    ///
    /// Parent Type: `MangaNodeList`
    nonisolated public struct Mangas: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.MangaNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("totalCount", Int.self),
        .field("pageInfo", PageInfo.self),
        .field("nodes", [Node].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MangaListQuery.Data.Mangas.self
      ] }

      public var totalCount: Int { __data["totalCount"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }
      public var nodes: [Node] { __data["nodes"] }

      /// Mangas.PageInfo
      ///
      /// Parent Type: `PageInfo`
      nonisolated public struct PageInfo: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.PageInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("startCursor", SuwayomiAPI.Cursor?.self),
          .field("endCursor", SuwayomiAPI.Cursor?.self),
          .field("hasNextPage", Bool.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MangaListQuery.Data.Mangas.PageInfo.self
        ] }

        /// When paginating backwards, the cursor to continue.
        public var startCursor: SuwayomiAPI.Cursor? { __data["startCursor"] }
        /// When paginating forwards, the cursor to continue.
        public var endCursor: SuwayomiAPI.Cursor? { __data["endCursor"] }
        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool { __data["hasNextPage"] }
      }

      /// Mangas.Node
      ///
      /// Parent Type: `MangaType`
      nonisolated public struct Node: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.MangaType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("title", String.self),
          .field("thumbnailUrl", String?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MangaListQuery.Data.Mangas.Node.self
        ] }

        public var id: Int { __data["id"] }
        public var title: String { __data["title"] }
        public var thumbnailUrl: String? { __data["thumbnailUrl"] }
      }
    }
  }
}
