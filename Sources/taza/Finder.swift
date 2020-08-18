//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

struct Finder {
    func find(resource: String) {
        var files = [File]()
        
        Folder.current.files.recursive.forEach { file in
            if SearchableFile.files.contains(file.extension ?? "") {
                do {
                    let content = try file.readAsString()
                    if content.contains(resource) {
                        files.append(file)
                    }
                } catch {
                    print(error)
                }
            }
        }
        
        if !files.isEmpty {
            print("\n")
            files.forEach { print($0.name) }
        }
    }
}
