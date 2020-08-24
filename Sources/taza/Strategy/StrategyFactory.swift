//
//  StrategyFactory.swift
//  
//
//  Created by Beknar Danabek on 8/24/20.
//

import Foundation

struct StrategyFactory {
    static let shared = StrategyFactory()
    
    private init() {}
    
    func strategy(type: SearchableFileType, content: String) -> SearchStrategy {
        switch type {
        case .m:
            return ObjectiveCSearchStrategy(with: content)
        case .swift:
            return SwiftSearchStrategy(with: content)
        case .storyboard, .xib:
            return IBSearchStrategy(with: content)
        }
    }
}
