import Commander

let main = command(
    Flag("listFiles", default: false, description: "Should script list all found files")
) { listFiles in
    TazaCommand(listFiles: listFiles).run()
}

main.run()
