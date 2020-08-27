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
    var unusedResourcesInSearchableFiles: [Resource] {
        var usedResources = [Resource]()
    
        for file in searchableFiles {
            for resource in resources {
                if file.hasResource(resource) {
                    usedResources.append(resource)

                    continue
                }
            }
        }

        return resources.filter { !usedResources.contains($0) }
    }

    var searchableFiles: [Searchable] {
        searchableFilesController.searchableFiles
    }

    var resources: [Resource] {
        resourceController.resources
    }

    // MARK: - Private properties
    private var searchableFilesController: SearchableFileControllerProtocol
    private var resourceController: ResourceControllerProtocol

    // MARK: - Init
    init() {
        searchableFilesController = SearchableFileController()
        resourceController = ResourceController()
    }
}
