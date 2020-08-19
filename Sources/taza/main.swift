var finder = Finder()
let logger = Logger(with: finder.unusedResources())
logger.log()
