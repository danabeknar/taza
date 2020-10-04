//
//  Taza.swift
//  
//
//  Created by Beknar Danabek on 9/6/20.
//

import Foundation

struct Taza {
    // MARK: - Public properties
    let finder: Finder

    // MARK: - Init
    /// - Parameters:
    ///   - path: Specific path to be searched for
    ///   - listFiles: List all found files
    ///   - listFiles: List all found resources
    init(path: String, listFiles: Bool, listResources: Bool) {
        finder = Finder(directory: Directory(path: path, listFiles: listFiles, listResources: listResources),
                        logger: FinderLogger())
    }

    // MARK: - Public methods
    func run() {
        finder.findUnusedResources()
    }
}
