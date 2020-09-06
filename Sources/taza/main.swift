import Commander

let main = command(
    Option("path", default: ".", flag: "p", description: "Specific path to be searched for."),
    Flag("listFiles", default: false, description: "List all found files.")
) { path, listFiles in
    TazaCommand(path: path, listFiles: listFiles).run()
}

main.run()
