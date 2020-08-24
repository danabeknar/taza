//
//  IBSearchStrategy.swift
//  
//
//  Created by Beknar Danabek on 8/24/20.
//

import Foundation

struct IBSearchStrategy: SearchStrategy {
    var content: String
    
    init(with content: String) {
        self.content = content
    }
    
    func hasResource(_ resource: Resource) -> Bool {
        content.contains("image=\"" + resource.name + "\"")
    }
}
