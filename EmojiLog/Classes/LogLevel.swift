
public enum LogLevel: Int {
    case debug = 0
    case info = 1
    case waring = 2
    case error = 3
    
    var initial: String {
        switch self {
        case .debug: return "D"
        case .info: return "I"
        case .waring: return "W"
        case .error: return "E"
        }
    }
}
