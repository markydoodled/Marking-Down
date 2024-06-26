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
    var body: some View {
        HStack {
            TextEditor(text: $document.text)
                .padding()
                .font(.monospaced)
            Divider()
            Markdown {
                document.text
            }
            .padding()
        }
        .padding()
        .toolbar {
            ToolbarItem(id: "share-doc", placement: .primaryAction) {
                ShareLink()
            }
            ToolbarItem(id: "settings", placement: .primaryAction) {
                Button(action: {showingSettings = true}) {
                    Image(systemImage: "gearshape")
                }
            }
            ToolbarItem(id: "undo", placement: .secondaryAction) {
                Button(action: {}) {
                    Image(systemName: "") 
                }
            }
            ToolbarItem(id: "redo", placement: .secondaryAction) {
                Button(action: {}) {
                    Image(systemName: "") 
                }
            }
            ToolbarItem(id: "copy-text", placement: .secondaryAction) {
                Button(action: {}) {
                    Image(systemName: "") 
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
                    Label("Editor", systemImage: "")
                }
                Section {
                    LabelledContent("Version", value: "1.0")
                    LabelledContent("Build", value: "1") 
                } header: {
                    Label("Misc.", systemImage: "")
                }
            }
        }
    }
}

#Preview {
    ContentView(document: .constant(Marking_DownDocument()))
}
