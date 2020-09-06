//
//  SearchableFileController.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation
import Files

protocol SearchableFileControllerProtocol {
    var searchableFiles: [SearchableFileProtocol] { get }
}

struct SearchableFileController: SearchableFileControllerProtocol {
    // MARK: - Public properties
    var searchableFiles = [SearchableFileProtocol]()

    // MARK: - Private properties
    private lazy var searchableFileTypes = SearchableFileType.allCases.map { $0.rawValue }

    // MARK: - Init
    init() {
        searchableFiles = Folder.current.files.recursive
            .map { SearchableFile(file: $0) }
            .compactMap { $0 }
    }
}
