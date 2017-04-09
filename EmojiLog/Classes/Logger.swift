
import Foundation

public class Logger {
    var className: String
    var configuration: EmojiLogConfiguration
    
    init(className: String, configuration: EmojiLogConfiguration) {
        self.className = className
        self.configuration = configuration
    }
    
    public func debug(message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .debug, message: message, file: file, functionName: functionName, line: line)
    }
    
    public func info(message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .info, message: message, file: file, functionName: functionName, line: line)
    }
    
    public func warning(message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .waring, message: message, file: file, functionName: functionName, line: line)
    }
    
    public func error(message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .error, message: message, file: file, functionName: functionName, line: line)
    }
    
    private func printTrace(level: LogLevel,message: String, file: String, functionName: String, line: Int) {
        if configuration.disable {
            return
        }
        
        if level.rawValue < configuration.minLevel.rawValue {
            return
        }
        
        if className.isEmpty {
            className = file.components(separatedBy: "/").last!.replacingOccurrences(of: ".swift", with: "")
        }
        
        let emoji = configuration.emojiMap.map(level: level)
        let trace = configuration.traceBuilder
            .add(emoji: emoji)
            .add(level: level)
            .add(date: NSDate())
            .add(className: className)
            .add(functionName: functionName)
            .add(line:line)
            .add(message: message)
            .build()
        
        configuration.printer.printTrace(trace: trace)
    }
}

extension Logger {
    private(set) public static var configuration = EmojiLogConfiguration()
    
    public static func getLogWith(className: String) -> Logger {
        return Logger(className: className, configuration: configuration)
    }
    
    public static func getLog() -> Logger {
        return Logger(className: "", configuration: configuration)
    }
    
}
