//
//  ResourceLogger.swift
//  
//
//  Created by Beknar Danabek on 10/4/20.
//

import Foundation
import ColorizeSwift

struct ResourceLogger {
    // MARK: - Public methods
    func logStartSearchingResources() {
        print("\n🕯  Searching all resources..."
                .lightCyan())
    }
    
    func logResource(_ image: Resource) {
        print("🔍 Resource: \(image.name), path: \(image.path)")
    }
    
    func logResourcesCount(_ count: Int) {
        print("🖼  \("resource".pluralize(count)) found"
                .lightCyan()
                .bold())
    }
}
