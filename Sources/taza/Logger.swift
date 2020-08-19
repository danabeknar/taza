//
//  Logger.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation
import ColorizeSwift

struct Logger {
    let resources: [Image]
    
    init(with resources: [Image]) {
        self.resources = resources
    }
    
    func log() {
        if resources.isEmpty {
            print("\n🥳  Your codebase is awesome! I found nothing.".lightGreen())
            
            return
        }
        
        print("\n🧐  I have found \(resources.count) unused resources, make sure to look at them:\n".lightBlue().bold())
        resources.forEach { image in
            print("🔍 Resource: \(image.name), path: \(image.path)")
        }
    }
}
