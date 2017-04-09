
public protocol Loggable {
    var log: Logger { get }
}

extension Loggable {
    public var log: Logger {
        return Logger.getLog()
    }
}
