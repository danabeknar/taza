//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/24/20.
//

import Foundation

struct SwiftSearchStrategy: SearchStrategy {
    var content: String
    
    init(with content: String) {
        self.content = content
    }
    
    func hasResource(_ resource: Resource) -> Bool {
        return content.contains("UIImage(named: \"" + resource.name + "\")")
    }
}
