//
//  Logger.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation

struct Logger {
    let resources: [Image]
    
    init(with resources: [Image]) {
        self.resources = resources
    }
    
    func log() {
        if resources.isEmpty {
            print("Nothing found")
            
            return
        }
        
        print("\n")
        print("These resources are unused:")
        resources.forEach { image in
            print("Resource: \(image.name), type: \(image.type), path: \(image.path)")
        }
    }
}
