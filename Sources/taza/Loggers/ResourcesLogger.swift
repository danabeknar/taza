//
//  ResourcesLogger.swift
//  
//
//  Created by Beknar Danabek on 10/4/20.
//

import Foundation
import ColorizeSwift

struct ResourcesLogger {
    // MARK: - Public properties
    var foundResources: [Resource] {
        resourcesController.resources
    }
    
    // MARK: - Private properties
    private let resourcesController: ResourcesControllerProtocol
    private let listResources: Bool

    // MARK: - Init
    init(resourcesController: ResourcesControllerProtocol, listResources: Bool) {
        self.resourcesController = resourcesController
        self.listResources = listResources
    }
    // MARK: - Public methods
    func log() {
        logStartSearchingResources()
        if listResources {
            logResources()
        }
        logResourcesCount()
    }
    
    func logStartSearchingResources() {
        print("\n🕯  Searching all resources..."
                .lightCyan())
    }
    
    func logResources() {
        foundResources.forEach { print("🔍 Resource: \($0.name), path: \($0.path)") }
    }
    
    func logResourcesCount() {
        print("🖼  \("resource".pluralize(foundResources.count)) found"
                .lightCyan()
                .bold())
    }
}
