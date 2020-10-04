//
//  File.swift
//  
//
//  Created by Beknar Danabek on 8/26/20.
//

import Foundation

extension String {
    func pluralize(_ count: Int) -> String {
        if count == 0 {
            return "No \(self)"
        } else if count == 1 {
            return "\(count) \(self)"
        } else {
            return "\(count) \(self)s"
        }
    }
}
