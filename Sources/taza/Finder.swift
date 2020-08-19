//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

struct Finder {
    lazy var imageController = ImageController()
    var searchableFiles = [File]()
    
    init() {
        searchableFiles = Folder.current.files.recursive
            .filter { SearchableFile.files.contains($0.extension ?? "") }
    }
    
    mutating func unusedResources() -> [Image] {
        var unused = Set<Image>()
        searchableFiles.forEach { file in
            imageController.images.forEach { image in
                do {
                    let content = try file.readAsString()
                    if !content.contains(image.name) {
                        unused.insert(image)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        return Array(unused)
    }
}
