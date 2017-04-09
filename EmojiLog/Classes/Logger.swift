
import Foundation

public class Logger {
    let className: String
    public static var configuration = EmojiLogConfiguration()
    
    public init(className: String) {
        self.className = className
    }
    
    public func debug(message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .debug, message: message, functionName: functionName, line: line)
    }
    
    public func info(message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .info, message: message, functionName: functionName, line: line)
    }
    
    public func warning(message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .waring, message: message, functionName: functionName, line: line)
    }
    
    public func error(message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .error, message: message, functionName: functionName, line: line)
    }
    
    private func printTrace(level: LogLevel,message: String, functionName: String, line: Int) {
        let emoji = Logger.configuration.emojiMap.map(level: level)
        let trace = Logger.configuration.traceBuilder
            .add(emoji: emoji)
            .add(level: level)
            .add(date: NSDate())
            .add(className: className)
            .add(functionName: functionName)
            .add(line:line)
            .add(message: message)
            .build()
        
        Logger.configuration.printer.printTrace(trace: trace)
    }
}
