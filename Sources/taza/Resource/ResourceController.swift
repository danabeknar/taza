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
    let resources: [Resource]

    // MARK: - Private properties
    init() {
        resources = Folder.current.files.recursive
                        .map { Resource(file: $0) }
                        .compactMap { $0 }
    }
}
