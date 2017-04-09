
public protocol EmojiMap {
    init()
    func map(level: LogLevel) -> String
}

class EmojiMapDefault: EmojiMap {
    required init() {}
    
    func map(level: LogLevel) -> String {
        switch level {
        case .debug: return "🍀"
        case .info: return "🖥"
        case .waring: return "⚠️"
        case .error: return "‼️"
        }
    }
}

public final class SmileEmojiMap: EmojiMap {
    public init() {}
    
    public func map(level: LogLevel) -> String {
        switch level {
        case .debug: return "🤓"
        case .info: return "😎"
        case .waring: return "😨"
        case .error: return "😱"
        }
    }
}

