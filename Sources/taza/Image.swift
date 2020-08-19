//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

enum ImageType: String, CaseIterable {
    case img
    case jpg
    case pdf
    case png
}

struct Image: Hashable {
    let type: ImageType
    let name: String
    let path: String
    
    private init(type: ImageType, name: String, path: String) {
        self.type = type
        self.name = name
        self.path = path
    }
    
    init?(file: File) {
        guard let fileExtension = file.extension else {
            return nil
        }

        guard let type = ImageType(rawValue: fileExtension) else {
            return nil
        }
        
        self.init(type: type, name: file.name, path: file.path)
    }
}
