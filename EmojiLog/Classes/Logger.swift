
import Foundation

public class Logger {
    let className: String
    public static var configuration = EmojiLogConfiguration()
    
    public init(className: String) {
        self.className = className
    }
    
    public func debug(message: String, functionName: String = #function) {
        self.printTrace(level: .debug, message: message, functionName: functionName)
    }
    
    public func info(message: String, functionName: String = #function) {
        self.printTrace(level: .info, message: message, functionName: functionName)
    }
    
    public func warning(message: String, functionName: String = #function) {
        self.printTrace(level: .waring, message: message, functionName: functionName)
    }
    
    public func error(message: String, functionName: String = #function) {
        self.printTrace(level: .error, message: message, functionName: functionName)
    }
    
    private func printTrace(level: LogLevel,message: String, functionName: String = #function) {
        let emoji = Logger.configuration.emojiMap.map(level: level)
        let trace = Logger.configuration.traceBuilder
            .add(emoji: emoji)
            .add(level: level)
            .add(date: NSDate())
            .add(className: className)
            .add(functionName: functionName)
            .add(message: message)
            .build()
        
        Logger.configuration.printer.printTrace(trace: trace)
    }
}
