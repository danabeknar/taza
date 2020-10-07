//
//  FilesLogger.swift
//  
//
//  Created by Beknar Danabek on 10/4/20.
//

import Foundation
import ColorizeSwift

struct FilesLogger {
    // MARK: - Public properties
    var files: [SearchableFileProtocol] {
        filesController.files
    }
    
    // MARK: - Private properties
    private let filesController: FilesControllerProtocol
    private let listFiles: Bool

    // MARK: - Init
    init(filesController: FilesControllerProtocol, listFiles: Bool) {
        self.filesController = filesController
        self.listFiles = listFiles
    }
    
    // MARK: - Public methods
    func log() {
        logStartSearchingFiles()
        if listFiles {
            logFoundFiles()
        }
        logFoundFilesCount()
    }
    
    // MARK: - Private methods
    private func logStartSearchingFiles() {
        print("\n🕯  Searching files..."
                .yellow())
    }
    
    private func logFoundFiles() {
        files.forEach { print("📁 File: \($0.path)") }
    }
    
    private func logFoundFilesCount() {
        print("🗂  \("file".pluralize(files.count)) found"
                .yellow()
                .bold())
    }
}
