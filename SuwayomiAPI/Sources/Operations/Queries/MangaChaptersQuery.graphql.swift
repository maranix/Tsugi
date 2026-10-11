// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MangaChaptersQuery: GraphQLQuery {
  public static let operationName: String = "MangaChapters"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MangaChapters($id: Int, $first: Int, $after: Cursor, $orderBy: SortOrder) { chapters( condition: { mangaId: $id } first: $first after: $after order: { by: CHAPTER_NUMBER, byType: $orderBy } ) { __typename totalCount pageInfo { __typename startCursor endCursor hasNextPage } nodes { __typename id chapterNumber name realUrl scanlator } } }"#
    ))

  public var id: GraphQLNullable<Int32>
  public var first: GraphQLNullable<Int32>
  public var after: GraphQLNullable<Cursor>
  public var orderBy: GraphQLNullable<GraphQLEnum<SortOrder>>

  public init(
    id: GraphQLNullable<Int32>,
    first: GraphQLNullable<Int32>,
    after: GraphQLNullable<Cursor>,
    orderBy: GraphQLNullable<GraphQLEnum<SortOrder>>
  ) {
    self.id = id
    self.first = first
    self.after = after
    self.orderBy = orderBy
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "id": id,
    "first": first,
    "after": after,
    "orderBy": orderBy
  ] }

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("chapters", Chapters.self, arguments: [
        "condition": ["mangaId": .variable("id")],
        "first": .variable("first"),
        "after": .variable("after"),
        "order": [
          "by": "CHAPTER_NUMBER",
          "byType": .variable("orderBy")
        ]
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      MangaChaptersQuery.Data.self
    ] }

    public var chapters: Chapters { __data["chapters"] }

    /// Chapters
    ///
    /// Parent Type: `ChapterNodeList`
    nonisolated public struct Chapters: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.ChapterNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("totalCount", Int.self),
        .field("pageInfo", PageInfo.self),
        .field("nodes", [Node].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MangaChaptersQuery.Data.Chapters.self
      ] }

      public var totalCount: Int { __data["totalCount"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }
      public var nodes: [Node] { __data["nodes"] }

      /// Chapters.PageInfo
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
          MangaChaptersQuery.Data.Chapters.PageInfo.self
        ] }

        /// When paginating backwards, the cursor to continue.
        public var startCursor: SuwayomiAPI.Cursor? { __data["startCursor"] }
        /// When paginating forwards, the cursor to continue.
        public var endCursor: SuwayomiAPI.Cursor? { __data["endCursor"] }
        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool { __data["hasNextPage"] }
      }

      /// Chapters.Node
      ///
      /// Parent Type: `ChapterType`
      nonisolated public struct Node: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.ChapterType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("chapterNumber", Double.self),
          .field("name", String.self),
          .field("realUrl", String?.self),
          .field("scanlator", String?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MangaChaptersQuery.Data.Chapters.Node.self
        ] }

        public var id: Int { __data["id"] }
        public var chapterNumber: Double { __data["chapterNumber"] }
        public var name: String { __data["name"] }
        public var realUrl: String? { __data["realUrl"] }
        public var scanlator: String? { __data["scanlator"] }
      }
    }
  }
}
