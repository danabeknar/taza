//
//  ImageController.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

struct ImageController {
    public let images: [Image]
    
    init() {
        let images = Folder.current.files.recursive
            .map { Image(file: $0) }
            .compactMap { $0 }
        
        self.images = images
    }
}
