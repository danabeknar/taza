//
//  TazaCommand.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation

struct TazaCommand {
    // MARK: - Public properties
    let finder: Finder
    let logger: Logger
    let loggerViewModel: LoggerViewModelProtocol
    
    // MARK: - Private properties
    let listFiles: Bool

    // MARK: - Init
    init(path: String, listFiles: Bool) {
        finder = Finder(path: path)
        loggerViewModel = LoggerViewModel(finder: finder)
        logger = Logger(viewModel: loggerViewModel, logFiles: listFiles)
        
        self.listFiles = listFiles
    }

    // MARK: - Public methods
    func run() {
        logger.log()
    }
}
