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

    // MARK: - Init
    init(viewModel: LoggerViewModelProtocol) {
        self.viewModel = viewModel
    }

    // MARK: - Public methods
    func log() {
        logFoundFiles()
        logFoundResources()
        logRecourcesResult()
    }

    // MARK: - Private methods
    private func logFoundFiles() {
        print("\n🕯  Searching files..."
                .lightMagenta()
                .bold())
        print("🗂  \("file".pluralize(count: viewModel.foundFilesCount)) found"
                .lightMagenta())
    }

    private func logFoundResources() {
        print("\n🕯  Searching resources..."
                .lightCyan()
                .bold())
        print("🖼  \("resource".pluralize(count: viewModel.foundResourcesCount)) found"
                .lightCyan())
    }

    private func logRecourcesResult() {
        let resources = viewModel.unusedResources

        if resources.isEmpty {
            print("\n🥳  Your codebase is awesome! Each resource is used."
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
