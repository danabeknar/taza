//
//  Searchable.swift
//  
//
//  Created by Beknar Danabek on 8/24/20.
//

import Foundation

protocol Searchable {
    func hasResource(_ resource: Resource) -> Bool
}

protocol SearchableFileProtocol: Searchable {
    var path: String { get }
}
