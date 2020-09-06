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
    init(listFiles: Bool) {
        finder = Finder()
        loggerViewModel = LoggerViewModel(finder: finder)
        logger = Logger(viewModel: loggerViewModel)
        
        self.listFiles = listFiles
    }

    // MARK: - Public methods
    func run() {
        logger.log()
    }
}
