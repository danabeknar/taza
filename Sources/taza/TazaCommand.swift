//
//  TazaCommand.swift
//  
//
//  Created by Beknar Danabek on 8/19/20.
//

import Foundation
import Commander

struct TazaCommand {
    func run() {
        command(
            Option("path", default: ".", flag: "p", description: "Specific path to be searched for."),
            Flag("listFiles", default: false, description: "List all found files."),
            Flag("listResources", default: false, description: "List all found resources.")
        ) { path, listFiles, listResources in
            Taza(path: path, listFiles: listFiles, listResources: listResources).run()
        }.run()
    }
}
