//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

struct Finder {
    // MARK: - Public properties
    var onFindUnusedResource: ((Resource) -> Void)?
    var onFinishSearch: ((_ count: Int) -> Void)?
    
    private let searchableFiles: [SearchableFileProtocol]
    private let foundResources: [Resource]
    
    init(searchableFiles: [SearchableFileProtocol], foundResources: [Resource]) {
        self.searchableFiles = searchableFiles
        self.foundResources = foundResources
    }
    
    // MARK: - Public methods
    func findUnusedResources() {
        var unusedResourcesCount = 0
        
        for resource in foundResources {
            var resourceIsUnused = true
            for file in searchableFiles {
                if file.hasResource(resource) {
                    resourceIsUnused = false
                    
                    break
                }
            }
            
            if resourceIsUnused {
                unusedResourcesCount += 1
                onFindUnusedResource?(resource)
            }
        }
        
        onFinishSearch?(unusedResourcesCount)
    }
}
