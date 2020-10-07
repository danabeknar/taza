//
//  Logger.swift
//  
//
//  Created by Beknar Danabek on 10/7/20.
//

import Foundation

struct Logger {
    private let filesLogger: FilesLogger
    private let resourceLogger: ResourcesLogger
    private let finderLogger: FinderLogger
    
    init(filesLogger: FilesLogger, resourceLogger: ResourcesLogger, finderLogger: FinderLogger) {
        self.filesLogger = filesLogger
        self.resourceLogger = resourceLogger
        self.finderLogger = finderLogger
    }
    
    public func log() {
        filesLogger.log()
        resourceLogger.log()
        finderLogger.log()
    }
}
