//
//  ResourceController.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

protocol ResourceControllerProtocol {
    var resources: [Resource] { get }
}

struct ResourceController: ResourceControllerProtocol {
    // MARK: - Public properties
    var resources = [Resource]()
    
    // MARK: - Private properties
    private let logger: ResourceLogger

    // MARK: - Private properties
    init(path: String, listResources: Bool) {
        logger = ResourceLogger()
        
        logger.logStartSearchingResources()
        do {
            resources = try Folder(path: path).files.recursive
                            .map { Resource(file: $0) }
                            .compactMap { $0 }
                            .map { resource in
                                if listResources {
                                    logger.logResource(resource)
                                }
                                return resource
                            }
        } catch {
            resources = []
        }
        logger.logResourcesCount(resources.count)
    }
}
