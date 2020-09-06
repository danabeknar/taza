//
//  LoggerViewModel.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation

protocol LoggerViewModelProtocol {
    var unusedResources: [Resource] { get }
    var foundFiles: [SearchableFileProtocol] { get }
    var foundResourcesCount: Int { get }
}

struct LoggerViewModel: LoggerViewModelProtocol {
    // MARK: - Public properties
    var unusedResources: [Resource] {
        finder.unusedResourcesInSearchableFiles
    }

    var foundFiles: [SearchableFileProtocol] {
        finder.searchableFiles
    }

    var foundResourcesCount: Int {
        finder.resources.count
    }

    // MARK: - Private properties
    private let finder: Finder

    // MARK: - Init
    init(finder: Finder) {
        self.finder = finder
    }
}
