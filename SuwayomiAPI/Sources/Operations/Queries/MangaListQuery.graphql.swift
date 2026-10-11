// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MangaListQuery: GraphQLQuery {
  public static let operationName: String = "MangaList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MangaList($inLibrary: Boolean) { mangas(condition: { inLibrary: $inLibrary }) { __typename nodes { __typename id title thumbnailUrl } } }"#
    ))

  public var inLibrary: GraphQLNullable<Bool>

  public init(inLibrary: GraphQLNullable<Bool>) {
    self.inLibrary = inLibrary
  }

  @_spi(Unsafe) public var __variables: Variables? { ["inLibrary": inLibrary] }

  nonisolated public struct Data: SuwayomiAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { SuwayomiAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("mangas", Mangas.self, arguments: ["condition": ["inLibrary": .variable("inLibrary")]]),
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
        .field("nodes", [Node].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MangaListQuery.Data.Mangas.self
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
