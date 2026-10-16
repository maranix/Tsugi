// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchMangaAndChaptersMutation: GraphQLMutation {
  public static let operationName: String = "FetchMangaAndChapters"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation FetchMangaAndChapters($id: Int!) { fetchMangaAndChapters(input: { id: $id, fetchManga: true, fetchChapters: true }) { __typename manga { __typename artist author description genre status inLibrary realUrl hasDuplicateChapters unreadCount } chapters { __typename name id chapterNumber scanlator realUrl isRead isDownloaded isBookmarked } } }"#
    ))

  public var id: Int32

  public init(id: Int32) {
    self.id = id
  }

  @_spi(Unsafe) public var __variables: Variables? { ["id": id] }

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchMangaAndChapters", FetchMangaAndChapters?.self, arguments: ["input": [
        "id": .variable("id"),
        "fetchManga": true,
        "fetchChapters": true
      ]]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      FetchMangaAndChaptersMutation.Data.self
    ] }

    public var fetchMangaAndChapters: FetchMangaAndChapters? { __data["fetchMangaAndChapters"] }

    /// FetchMangaAndChapters
    ///
    /// Parent Type: `FetchMangaAndChaptersPayload`
    nonisolated public struct FetchMangaAndChapters: SuwayomiAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.FetchMangaAndChaptersPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("manga", Manga.self),
        .field("chapters", [Chapter].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.self
      ] }

      public var manga: Manga { __data["manga"] }
      public var chapters: [Chapter] { __data["chapters"] }

      /// FetchMangaAndChapters.Manga
      ///
      /// Parent Type: `MangaType`
      nonisolated public struct Manga: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.MangaType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("artist", String?.self),
          .field("author", String?.self),
          .field("description", String?.self),
          .field("genre", [String].self),
          .field("status", GraphQLEnum<SuwayomiAPI.MangaStatus>.self),
          .field("inLibrary", Bool.self),
          .field("realUrl", String?.self),
          .field("hasDuplicateChapters", Bool.self),
          .field("unreadCount", Int.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.Manga.self
        ] }

        public var artist: String? { __data["artist"] }
        public var author: String? { __data["author"] }
        public var description: String? { __data["description"] }
        public var genre: [String] { __data["genre"] }
        public var status: GraphQLEnum<SuwayomiAPI.MangaStatus> { __data["status"] }
        public var inLibrary: Bool { __data["inLibrary"] }
        public var realUrl: String? { __data["realUrl"] }
        public var hasDuplicateChapters: Bool { __data["hasDuplicateChapters"] }
        public var unreadCount: Int { __data["unreadCount"] }
      }

      /// FetchMangaAndChapters.Chapter
      ///
      /// Parent Type: `ChapterType`
      nonisolated public struct Chapter: SuwayomiAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.ChapterType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
          .field("id", Int.self),
          .field("chapterNumber", Double.self),
          .field("scanlator", String?.self),
          .field("realUrl", String?.self),
          .field("isRead", Bool.self),
          .field("isDownloaded", Bool.self),
          .field("isBookmarked", Bool.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.Chapter.self
        ] }

        public var name: String { __data["name"] }
        public var id: Int { __data["id"] }
        public var chapterNumber: Double { __data["chapterNumber"] }
        public var scanlator: String? { __data["scanlator"] }
        public var realUrl: String? { __data["realUrl"] }
        public var isRead: Bool { __data["isRead"] }
        public var isDownloaded: Bool { __data["isDownloaded"] }
        public var isBookmarked: Bool { __data["isBookmarked"] }
      }
    }
  }
}
