//
//  ContentView.swift
//  Marking Down
//
//  Created by Mark Howard on 09/04/2024.
//

import SwiftUI
#if os(iOS)
import MarkdownUI
#endif

struct ContentView: View {
    @Binding var document: Marking_DownDocument
    @State var showingSettings = false
    @Environment(\.undoManager) var undoManager
    var body: some View {
        HStack {
            GroupBox {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        TextEditor(text: $document.text)
                            .monospaced()
                            .scrollContentBackground(.hidden)
                        Spacer()
                    }
                    Spacer()
                }
            }
            Divider()
            GroupBox {
                ScrollView {
                    VStack {
                        HStack {
                            Markdown {
                                document.text
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .toolbar(id: "quick-actions") {
            ToolbarItem(id: "settings", placement: .primaryAction) {
                Button(action: {showingSettings = true}) {
                    Image(systemName: "gearshape")
                }
                .sheet(isPresented: $showingSettings) {
                    settings
                }
            }
            ToolbarItem(id: "undo", placement: .secondaryAction) {
                Button(action: {undoManager?.undo()}) {
                    Image(systemName: "arrow.uturn.backward.circle")
                }
            }
            ToolbarItem(id: "redo", placement: .secondaryAction) {
                Button(action: {undoManager?.redo()}) {
                    Image(systemName: "arrow.uturn.forward.circle")
                }
            }
            ToolbarItem(id: "copy-text", placement: .secondaryAction) {
                Button(action: {}) {
                    Image(systemName: "text.badge.plus")
                }
            }
        }
        .toolbarRole(.editor)
    }
    var settings: some View {
        NavigationStack {
            Form {
                Section {
                    
                } header: {
                    Label("Editor", systemImage: "pencil")
                }
                Section {
                    LabeledContent("Version", value: "1.0")
                    LabeledContent("Build", value: "1")
                } header: {
                    Label("Misc.", systemImage: "info.circle")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {showingSettings = false}) {
                        Text("Done")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(document: .constant(Marking_DownDocument()))
}
