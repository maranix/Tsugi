// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchSourceMangaListMutation: GraphQLMutation {
  public static let operationName: String = "FetchSourceMangaList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation FetchSourceMangaList($page: Int! = 1, $type: FetchSourceMangaType! = LATEST, $source: LongString!) { fetchSourceManga(input: { page: $page, source: $source, type: $type }) { __typename hasNextPage mangas { __typename id title thumbnailUrl } } }"#
    ))

  public var page: Int32
  public var type: GraphQLEnum<FetchSourceMangaType>
  public var source: LongString

  public init(
    page: Int32 = 1,
    type: GraphQLEnum<FetchSourceMangaType> = .init(.latest),
    source: LongString
  ) {
    self.page = page
    self.type = type
    self.source = source
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "type": type,
    "source": source
  ] }

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchSourceManga", FetchSourceManga?.self, arguments: ["input": [
        "page": .variable("page"),
        "source": .variable("source"),
        "type": .variable("type")
      ]]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      FetchSourceMangaListMutation.Data.self
    ] }

    public var fetchSourceManga: FetchSourceManga? { __data["fetchSourceManga"] }

    /// FetchSourceManga
    ///
    /// Parent Type: `FetchSourceMangaPayload`
    nonisolated public struct FetchSourceManga: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.FetchSourceMangaPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("hasNextPage", Bool.self),
        .field("mangas", [Manga].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        FetchSourceMangaListMutation.Data.FetchSourceManga.self
      ] }

      public var hasNextPage: Bool { __data["hasNextPage"] }
      public var mangas: [Manga] { __data["mangas"] }

      /// FetchSourceManga.Manga
      ///
      /// Parent Type: `MangaType`
      nonisolated public struct Manga: SuwayomiAPI.SelectionSet {
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
          FetchSourceMangaListMutation.Data.FetchSourceManga.Manga.self
        ] }

        public var id: Int { __data["id"] }
        public var title: String { __data["title"] }
        public var thumbnailUrl: String? { __data["thumbnailUrl"] }
      }
    }
  }
}
