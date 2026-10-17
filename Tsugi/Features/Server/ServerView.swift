import SwiftUI

struct ServerView: View {
    @Environment(AppPreferences.self) private var preferences

    @State private var router = NavigationRouter<RouteCoordinator.Destination>()
    @State private var viewModel = ServerViewModel()

    var body: some View {
        NavigationStack(path: $router.stack) {
            ServerContentView {
                if let dashboard = viewModel.dashboard {
                    List {
                        Section {
                            HStack(spacing: 16) {
                                Image(systemName: SFSymbol.server)
                                    .font(.system(size: 28, weight: .semibold))
                                    .foregroundStyle(.tint)
                                    .frame(width: 48, height: 48)
                                    .background(Color.accentColor.opacity(0.12))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

                                VStack(alignment: .leading, spacing: 2) {
                                    Text(dashboard.about.name)
                                        .font(.headline)

                                    Text("Suwayomi v\(dashboard.about.version)")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)

                                    Text("\(dashboard.about.platform.osInfo.name) • \(dashboard.about.platform.arch)")
                                        .font(.caption)
                                        .foregroundStyle(.tertiary)
                                }
                            }
                            .padding(.vertical, 4)

                            LabeledContent("Build Type", value: dashboard.about.buildType.capitalized)
                            LabeledContent("JVM", value: "\(dashboard.about.platform.jvmInfo.vmName) (\(dashboard.about.platform.jvmInfo.javaVersion))")
                            LabeledContent("Headless", value: dashboard.about.platform.headless ? "Yes" : "No")
                        }

                        Section {
                            LabeledContent("Update Interval") {
                                Text("\(Int(dashboard.settings.library.globalUpdateIntervalHrs)) hrs")
                                    .foregroundStyle(.secondary)
                            }
                            LabeledContent("Parallel Source Checks") {
                                Text("\(dashboard.settings.library.maxSourcesInParallel)")
                                    .foregroundStyle(.secondary)
                            }
                            LabeledContent("Exclude Completed") {
                                statusText(dashboard.settings.library.excludeCompleted)
                            }
                            LabeledContent("Exclude Not Started") {
                                statusText(dashboard.settings.library.excludeNotStarted)
                            }
                        } header: {
                            Text("Library & Updates")
                        } footer: {
                            Text(
                                "Controls how frequently the server checks sources for new chapters " +
                                "and how updates are filtered."
                            )
                        }

                        Section {
                            LabeledContent("Auto-Download New") {
                                statusText(dashboard.settings.downloads.autoDownloadNewChapters)
                            }
                            if dashboard.settings.downloads.autoDownloadNewChapters {
                                LabeledContent("Download Limit") {
                                    Text("\(dashboard.settings.downloads.autoDownloadNewChaptersLimit) chapters")
                                        .foregroundStyle(.secondary)
                                }
                                LabeledContent("Ignore Re-uploads") {
                                    statusText(dashboard.settings.downloads.autoDownloadIgnoreReUploads)
                                }
                            }
                            LabeledContent("Archive Format") {
                                Text(dashboard.settings.downloads.downloadAsCbz ? "CBZ Archive" : "Raw Directory")
                                    .foregroundStyle(.secondary)
                            }
                        } header: {
                            Text("Downloads")
                        }

                        Section {
                            LabeledContent("Status") {
                                statusText(
                                    dashboard.settings.flareSolverr.enabled,
                                    activeText: "Enabled",
                                    inactiveText: "Disabled"
                                )
                            }
                            if dashboard.settings.flareSolverr.enabled {
                                LabeledContent("URL") {
                                    let url = dashboard.settings.flareSolverr.url
                                    Text(url.isEmpty ? "Not configured" : url)
                                        .lineLimit(1)
                                        .truncationMode(.middle)
                                        .foregroundStyle(.secondary)
                                }
                                LabeledContent("Timeout") {
                                    Text("\(dashboard.settings.flareSolverr.timeout)s")
                                        .foregroundStyle(.secondary)
                                }
                            }
                        } header: {
                            Text("FlareSolverr")
                        } footer: {
                            Text("Resolves Cloudflare and DDoS-Guard anti-bot challenges on manga sources.")
                        }

                        Section {
                            LabeledContent("Frequency") {
                                Text("Every \(dashboard.settings.backup.intervalHrs) hrs")
                                    .foregroundStyle(.secondary)
                            }
                            LabeledContent("Retention Keep Limit") {
                                Text("\(dashboard.settings.backup.ttl) backups")
                                    .foregroundStyle(.secondary)
                            }
                            LabeledContent("Include Categories") {
                                statusText(dashboard.settings.backup.includeCategories)
                            }
                            LabeledContent("Include Manga") {
                                statusText(dashboard.settings.backup.includeManga)
                            }
                            LabeledContent("Include Tracking") {
                                statusText(dashboard.settings.backup.includeTracking)
                            }
                        } header: {
                            Text("Automated Backups")
                        }

                        Section {
                            pathRow(title: "Downloads", path: dashboard.settings.storage.downloadsPath)
                            pathRow(title: "Local Sources", path: dashboard.settings.storage.localSourcePath)
                            pathRow(title: "Backups", path: dashboard.settings.storage.backupPath)
                        } header: {
                            Text("Storage Locations")
                        } footer: {
                            Text("Directories configured on the host server.")
                        }

                        Section {
                            Link(destination: dashboard.about.github) {
                                HStack {
                                    Label("GitHub Repository", systemImage: "link")
                                    Spacer()
                                    Image(systemName: "arrow.up.right")
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            Link(destination: dashboard.about.discord) {
                                HStack {
                                    Label("Discord Community", systemImage: "bubble.left.and.bubble.right")
                                    Spacer()
                                    Image(systemName: "arrow.up.right")
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        } header: {
                            Text("About")
                        }
                    }
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("Server")
            .refreshable {
                await viewModel.populateDashboard()
            }
            .task {
                if viewModel.dashboard == nil {
                    await viewModel.populateDashboard()
                }
            }
            .onChange(of: preferences.serverUrl) {
                if preferences.serverUrl != nil {
                    Task {
                        await viewModel.populateDashboard()
                    }
                }
            }
        }
    }

    private func statusText(_ active: Bool, activeText: String = "Yes", inactiveText: String = "No") -> some View {
        Text(active ? activeText : inactiveText)
            .foregroundStyle(active ? Color.primary : Color.secondary)
    }

    private func pathRow(title: String, path: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
            Text(path.isEmpty ? "Default" : path)
                .font(.caption)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
        .padding(.vertical, 2)
    }
}
