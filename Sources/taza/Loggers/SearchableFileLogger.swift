//
//  SearchableFileLogger.swift
//  
//
//  Created by Beknar Danabek on 10/4/20.
//

import Foundation
import ColorizeSwift

struct SearchableFileLogger {
    // MARK: - Public methods
    func logStartSearchingFiles() {
        print("\n🕯  Searching files..."
                .yellow())
    }
    
    func logFoundFile(_ file: SearchableFileProtocol) {
        print("📁 File: \(file.path)")
    }
    
    func logFoundFilesCount(_ count: Int) {
        print("🗂  \("file".pluralize(count)) found"
                .yellow()
                .bold())
    }
}
