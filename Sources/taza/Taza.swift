//
//  Taza.swift
//  
//
//  Created by Beknar Danabek on 9/6/20.
//

import Foundation

struct Taza {
    // MARK: - Public properties
    let logger: Logger

    // MARK: - Init
    /// - Parameters:
    ///   - path: Specific path to be searched for
    ///   - listFiles: List all found files
    ///   - listFiles: List all found resources
    init(path: String, listFiles: Bool, listResources: Bool) {
        let filesController = FilesController(path: path)
        let resourcesController = ResourcesController(path: path)
        
        let filesLogger = FilesLogger(filesController: filesController, listFiles: listFiles)
        let resourceLogger = ResourcesLogger(resourcesController: resourcesController, listResources: listResources)
        let finderLogger = FinderLogger(searchableFiles: filesController.files, foundResources: resourcesController.resources)
        
        logger = Logger(filesLogger: filesLogger, resourceLogger: resourceLogger, finderLogger: finderLogger)
    }

    // MARK: - Public methods
    func run() {
        logger.log()
    }
}
