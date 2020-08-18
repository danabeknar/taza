//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

struct Finder {
    func find() {
        var files = [File]()

        Folder.current.files.recursive.forEach { file in
            do {
                let content = try file.readAsString()
                if content.contains("swift") {
                    files.append(file)
                }
            } catch {
                print(error)
            }
        }

        if !files.isEmpty {
            print("\n")
            print("These files contains:")
            files.forEach { print($0.name) }
        }
    }
}
