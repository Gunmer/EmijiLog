
import Foundation

open class Logger {
    fileprivate var className: String
    fileprivate var configuration: EmojiLogConfiguration
    
    init(className: String, configuration: EmojiLogConfiguration) {
        self.className = className
        self.configuration = configuration
    }
    
    open func debug(_ message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .debug, message: message, file: file, functionName: functionName, line: line)
    }
    
    open func info(_ message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .info, message: message, file: file, functionName: functionName, line: line)
    }
    
    open func warning(_ message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .waring, message: message, file: file, functionName: functionName, line: line)
    }
    
    open func error(_ message: String, file: String = #file, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .error, message: message, file: file, functionName: functionName, line: line)
    }
    
    fileprivate func printTrace(level: LogLevel,message: String, file: String, functionName: String, line: Int) {
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
            .add(date: Date())
            .add(className: className)
            .add(functionName: functionName)
            .add(line:line)
            .add(message: message)
            .build()
        
        configuration.printer.printTrace(trace: trace)
    }
}

extension Logger {
    fileprivate(set) public static var configuration = EmojiLogConfiguration()
    
    public static func getLogWith(className: String) -> Logger {
        return Logger(className: className, configuration: configuration)
    }
    
    public static func getLog() -> Logger {
        return Logger(className: "", configuration: configuration)
    }
    
}
