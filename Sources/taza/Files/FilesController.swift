//
//  FilesController.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation
import Files

protocol FilesControllerProtocol {
    var files: [SearchableFileProtocol] { get }
}

struct FilesController: FilesControllerProtocol {
    // MARK: - Public properties
    var files = [SearchableFileProtocol]()

    // MARK: - Private properties
    private lazy var searchableFileTypes = SearchableFileType.allCases.map { $0.rawValue }

    // MARK: - Init
    init(path: String) {
        do {
            files = try Folder(path: path).files.recursive
                .filter { !$0.path.contains("Pods") }
                .map { SearchableFile(file: $0) }
                .compactMap { $0 }
        } catch {
            files = []
        }
    }
}
