//
//  Directory.swift
//  
//
//  Created by Beknar Danabek on 10/4/20.
//

import Foundation

struct Directory {
    // MARK: - Public properties
    var searchableFiles: [SearchableFileProtocol] {
        searchableFilesController.searchableFiles
    }

    var resources: [Resource] {
        resourceController.resources
    }
    
    // MARK: - Private properties
    private var searchableFilesController: SearchableFileControllerProtocol
    private var resourceController: ResourceControllerProtocol

    // MARK: - Init
    init(path: String, listFiles: Bool, listResources: Bool) {
        searchableFilesController = SearchableFileController(path: path, listFiles: listFiles)
        resourceController = ResourceController(path: path, listResources: listResources)
    }
}
