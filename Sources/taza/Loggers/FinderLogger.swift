//
//  FinderLogger.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation
import ColorizeSwift

struct FinderLogger {
    // MARK: - Public methods
    func logStartSearchingResources() {
        print("\n🕯  Searching unused resources..."
                .magenta())
    }

    func logResource(_ image: Resource) {
        print("🔍 Resource: \(image.name), path: \(image.path)")
    }

    func logResourcesCount(_ count: Int) {
        if count == 0 {
            print("\n🥳  Your codebase is awesome! No unused resources found"
                    .lightGreen()
                    .bold())
            return
        }
        
        print("🧐  I have found \("unused resource".pluralize(count)), make sure to look at them ⬆️"
                .magenta()
                .bold())
    }
}
