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
    var body: some View {
        HStack {
            TextEditor(text: $document.text)
            Divider()
            Markdown {
                document.text
            }
        }
        .toolbar {
            ToolbarItem(id: "test", placement: .primaryAction) {
                Button(action: {}) {
                    Text("Test")
                }
            }
        }
        .toolbarRole(.editor)
    }
}

#Preview {
    ContentView(document: .constant(Marking_DownDocument()))
}
