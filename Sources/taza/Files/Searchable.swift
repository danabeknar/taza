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

typealias SearchableFileProtocol = Searchable & FileProtocol
