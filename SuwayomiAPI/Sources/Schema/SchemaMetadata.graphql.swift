// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

nonisolated public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == SuwayomiAPI.SchemaMetadata {}

nonisolated public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == SuwayomiAPI.SchemaMetadata {}

nonisolated public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == SuwayomiAPI.SchemaMetadata {}

nonisolated public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == SuwayomiAPI.SchemaMetadata {}

nonisolated public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  private static let objectTypeMap: [String: ApolloAPI.Object] = [
    "CategoryNodeList": SuwayomiAPI.Objects.CategoryNodeList,
    "ChapterNodeList": SuwayomiAPI.Objects.ChapterNodeList,
    "DownloadNodeList": SuwayomiAPI.Objects.DownloadNodeList,
    "ExtensionNodeList": SuwayomiAPI.Objects.ExtensionNodeList,
    "ExtensionStoreNodeList": SuwayomiAPI.Objects.ExtensionStoreNodeList,
    "GlobalMetaNodeList": SuwayomiAPI.Objects.GlobalMetaNodeList,
    "MangaNodeList": SuwayomiAPI.Objects.MangaNodeList,
    "MangaType": SuwayomiAPI.Objects.MangaType,
    "Query": SuwayomiAPI.Objects.Query,
    "SourceNodeList": SuwayomiAPI.Objects.SourceNodeList,
    "TrackRecordNodeList": SuwayomiAPI.Objects.TrackRecordNodeList,
    "TrackerNodeList": SuwayomiAPI.Objects.TrackerNodeList
  ]

  @_spi(Execution) public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    objectTypeMap[typename]
  }
}

nonisolated public enum Objects {}
nonisolated public enum Interfaces {}
nonisolated public enum Unions {}
