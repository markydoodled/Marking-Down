//
//  Marking_DownDocument.swift
//  Marking Down
//
//  Created by Mark Howard on 09/04/2024.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var markingdownText: UTType {
        UTType(importedAs: "com.MSJ.Marking-Down.text")
    }
}

struct Marking_DownDocument: FileDocument {
    var text: String

    init(text: String = "Hello World!") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.markingdownText, .text, .plainText, .utf8PlainText, .utf16PlainText] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
