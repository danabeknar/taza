//
//  Logger.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation
import ColorizeSwift

struct Logger {
    // MARK: - Private properties
    private let viewModel: LoggerViewModelProtocol
    private let logFiles: Bool

    // MARK: - Init
    init(viewModel: LoggerViewModelProtocol, logFiles: Bool) {
        self.viewModel = viewModel
        self.logFiles = logFiles
    }

    // MARK: - Public methods
    func log() {
        logFoundFiles()
        logFoundResources()
        logResourcesResult()
    }

    // MARK: - Private methods
    private func logFoundFiles() {
        print("\n🕯  Searching files..."
                .lightMagenta()
                .bold())
        print("🗂  \("file".pluralize(count: viewModel.foundFiles.count)) found\(logFiles ? ":" : "")"
                .lightMagenta())
        
        if logFiles {
            viewModel.foundFiles.forEach { file in
                print("📁 File: \(file.path)")
            }
        }
    }

    private func logFoundResources() {
        print("\n🕯  Searching resources..."
                .lightCyan()
                .bold())
        print("🖼  \("resource".pluralize(count: viewModel.foundResourcesCount)) found"
                .lightCyan())
    }

    private func logResourcesResult() {
        let resources = viewModel.unusedResources

        if resources.isEmpty {
            print("\n🥳  Your codebase is awesome! No unused resources found."
                    .lightGreen())

            return
        }

        print("\n🧐  I have found \("unused resource".pluralize(count: resources.count)), make sure to look at them:"
                .lightBlue()
                .bold())
        resources.forEach { image in
            print("🔍 Resource: \(image.name), path: \(image.path)")
        }
    }
}
