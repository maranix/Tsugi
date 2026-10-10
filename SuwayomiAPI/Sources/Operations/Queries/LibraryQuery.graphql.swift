// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct LibraryQuery: GraphQLQuery {
  public static let operationName: String = "Library"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Library { mangas(filter: { inLibrary: { equalTo: true } }) { __typename totalCount nodes { __typename id title thumbnailUrl genre } } }"#
    ))

  public init() {}

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("mangas", Mangas.self, arguments: ["filter": ["inLibrary": ["equalTo": true]]]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      LibraryQuery.Data.self
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
        .field("nodes", [Node].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        LibraryQuery.Data.Mangas.self
      ] }

      public var totalCount: Int { __data["totalCount"] }
      public var nodes: [Node] { __data["nodes"] }

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
          .field("genre", [String].self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          LibraryQuery.Data.Mangas.Node.self
        ] }

        public var id: Int { __data["id"] }
        public var title: String { __data["title"] }
        public var thumbnailUrl: String? { __data["thumbnailUrl"] }
        public var genre: [String] { __data["genre"] }
      }
    }
  }
}
