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
    let logger: Logger
    let loggerViewModel: LoggerViewModelProtocol

    // MARK: - Init
    /// - Parameters:
    ///   - path: Specific path to be searched for
    ///   - listFiles: List all found files
    init(path: String, listFiles: Bool) {
        finder = Finder(path: path)
        loggerViewModel = LoggerViewModel(finder: finder)
        logger = Logger(viewModel: loggerViewModel, logFiles: listFiles)
    }

    // MARK: - Public methods
    func run() {
        logger.log()
    }
}
