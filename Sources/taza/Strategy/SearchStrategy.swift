//
//  SearchStrategy.swift
//  
//
//  Created by Beknar Danabek on 8/24/20.
//

import Foundation

protocol SearchStrategy: Searchable {
    var content: String { get }
    
    init(with content: String)
}
