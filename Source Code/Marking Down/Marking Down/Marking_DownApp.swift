//
//  Marking_DownApp.swift
//  Marking Down
//
//  Created by Mark Howard on 09/04/2024.
//

import SwiftUI
import DocumentKit

@main
struct Marking_DownApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: Marking_DownDocument()) { file in
            ContentView(document: file.$document)
        }
        #if os(iOS)
        .showFileExtensions(true)
        #endif
        .commands {
            TextEditingCommands()
        }
    }
}
