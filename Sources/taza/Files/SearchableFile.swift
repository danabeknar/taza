//
//  SearchableFile.swift
//  
//
//  Created by Beknar Danabek on 8/24/20.
//

import Files

struct SearchableFile: SearchableFileProtocol {
    let path: String
    let content: String
    let type: SearchableFileType
    let strategy: SearchStrategy

    private init(path: String, type: SearchableFileType, content: String) {
        self.path = path
        self.type = type
        self.content = content
        
        strategy = StrategyFactory.shared.strategy(type: type, content: content)
    }

    init?(file: File) {
        guard let fileExtension = file.extension else {
            return nil
        }

        guard let type = SearchableFileType(rawValue: fileExtension) else {
            return nil
        }

        do {
            let content = try file.readAsString()
            self.init(path: file.path(relativeTo: Folder.current), type: type, content: content)
        } catch {
            return nil
        }
    }

    func hasResource(_ resource: Resource) -> Bool {
        strategy.hasResource(resource)
    }
}
