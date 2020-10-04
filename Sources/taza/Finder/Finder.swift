//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

struct Finder {
    // MARK: - Private properties
    private let directory: Directory
    private let logger: FinderLogger

    // MARK: - Init
    init(directory: Directory, logger: FinderLogger) {
        self.directory = directory
        self.logger = logger
    }
    
    // MARK: - Public methods
    func findUnusedResources() {
        var unusedResources = [Resource]()
        
        logger.logStartSearchingResources()
        for resource in directory.resources {
            var resourceIsUnused = true
            for file in directory.searchableFiles {
                if file.hasResource(resource) {
                    resourceIsUnused = false
                    
                    break
                }
            }
            
            if resourceIsUnused {
                logger.logResource(resource)
                unusedResources.append(resource)
            }
        }
        
        logger.logResourcesCount(unusedResources.count)
    }
}
