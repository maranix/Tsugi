// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MangaDetailsQuery: GraphQLQuery {
  public static let operationName: String = "MangaDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MangaDetails($id: Int) { mangas(condition: { id: $id }) { __typename nodes { __typename artist author description genre status realUrl inLibrary } } }"#
    ))

  public var id: GraphQLNullable<Int32>

  public init(id: GraphQLNullable<Int32>) {
    self.id = id
  }

  @_spi(Unsafe) public var __variables: Variables? { ["id": id] }

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("mangas", Mangas.self, arguments: ["condition": ["id": .variable("id")]]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      MangaDetailsQuery.Data.self
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
        .field("nodes", [Node].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MangaDetailsQuery.Data.Mangas.self
      ] }

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
          .field("artist", String?.self),
          .field("author", String?.self),
          .field("description", String?.self),
          .field("genre", [String].self),
          .field("status", GraphQLEnum<SuwayomiAPI.MangaStatus>.self),
          .field("realUrl", String?.self),
          .field("inLibrary", Bool.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MangaDetailsQuery.Data.Mangas.Node.self
        ] }

        public var artist: String? { __data["artist"] }
        public var author: String? { __data["author"] }
        public var description: String? { __data["description"] }
        public var genre: [String] { __data["genre"] }
        public var status: GraphQLEnum<SuwayomiAPI.MangaStatus> { __data["status"] }
        public var realUrl: String? { __data["realUrl"] }
        public var inLibrary: Bool { __data["inLibrary"] }
      }
    }
  }
}
