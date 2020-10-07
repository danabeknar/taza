//
//  ResourcesController.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

protocol ResourcesControllerProtocol {
    var resources: [Resource] { get }
}

struct ResourcesController: ResourcesControllerProtocol {
    // MARK: - Public properties
    var resources = [Resource]()

    // MARK: - Init
    init(path: String) {
        do {
            resources = try Folder(path: path).files.recursive
                            .filter { !$0.path.contains("Pods") }
                            .map { Resource(file: $0) }
                            .compactMap { $0 }
        } catch {
            resources = []
        }
    }
}
