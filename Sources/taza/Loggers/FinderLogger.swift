//
//  FinderLogger.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation
import ColorizeSwift

class FinderLogger {
    // MARK: - Private properties
    private var finder: Finder
    
    // MARK: - Init
    init(searchableFiles: [SearchableFileProtocol], foundResources: [Resource]) {
        finder = Finder(searchableFiles: searchableFiles, foundResources: foundResources)
        bindToFinder()
    }
    
    // MARK: - Public methods
    func log() {
        logStartSearchingResources()
        finder.findUnusedResources()
    }
    
    func logStartSearchingResources() {
        print("\n🕯  Searching unused resources..."
                .magenta())
    }

    func logResource(_ resource: Resource) {
        print("🔍 Resource: \(resource.name), path: \(resource.path)")
    }

    func logResourcesCount(_ count: Int) {
        if count == 0 {
            print("\n🥳  Your codebase is awesome! No unused resources found"
                    .lightGreen()
                    .bold())
            return
        }
        
        print("🧐  I have found \("unused resource".pluralize(count)), make sure to look at them ⬆️"
                .magenta()
                .bold())
    }
    
    // MARK: - Private methods
    private func bindToFinder() {
        finder.onFindUnusedResource = { [weak self] resource in
            self?.logResource(resource)
        }
        
        finder.onFinishSearch = { [weak self] count in
            self?.logResourcesCount(count)
        }
    }
}
