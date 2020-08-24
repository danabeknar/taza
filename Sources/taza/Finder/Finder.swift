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
        var unusedResources = Set<Resource>()

        resources.forEach { resource in
            searchableFiles.forEach { file in
                if !file.hasResource(resource) {
                    unusedResources.insert(resource)
                }
            }
        }

        return Array(unusedResources)
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
