//
//  LoggerViewModel.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation

protocol LoggerViewModelProtocol {
    var unusedResources: [Resource] { get }
    var foundFilesCount: Int { get }
    var foundResourcesCount: Int { get }
}

struct LoggerViewModel: LoggerViewModelProtocol {
    // MARK: - Public properties
    var unusedResources: [Resource] {
        finder.unusedResourcesInSearchableFiles
    }

    var foundFilesCount: Int {
        finder.searchableFiles.count
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
