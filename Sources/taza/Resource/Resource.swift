//
//  Resource.swift
//  
//
//  Created by Beknar Danabek on 8/18/20.
//

import Foundation
import Files

struct Resource: Hashable {
    // MARK: - Public properties
    let name: String
    let nameExcludingExtension: String
    let path: String

    // MARK: - Private properties
    private let type: ResourceType

    // MARK: - Init
    private init(type: ResourceType,
                 name: String,
                 nameExcludingExtension: String,
                 path: String) {
        self.type = type
        self.name = name
        self.nameExcludingExtension = nameExcludingExtension
        self.path = path
    }

    init?(file: File) {
        guard let fileExtension = file.extension else {
            return nil
        }

        guard let type = ResourceType(rawValue: fileExtension) else {
            return nil
        }

        self.init(type: type,
                  name: file.name,
                  nameExcludingExtension: file.nameExcludingExtension,
                  path: file.path)
    }
}
