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
        contentContains(resource.nameExcludingExtension) || contentContains(resource.name)
    }

    private func contentContains(_ text: String) -> Bool {
        content.contains("image=\"" + text + "\"")
    }
}
