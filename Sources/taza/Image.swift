//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation

enum ImageType: String, CaseIterable {
    case img
    case jpg
    case pdf
}

struct Image {
    let type: ImageType
    let name: String
    let path: String
    
    private init(type: ImageType, name: String, path: String) {
        self.type = type
        self.name = name
        self.path = path
    }
    
    init?(name: String, path: String) {
        guard let typeString = name.components(separatedBy: ".").last,
            let type = ImageType(rawValue: typeString) else {
                return nil
        }
        
        self.init(type: type, name: name, path: path)
    }
}
