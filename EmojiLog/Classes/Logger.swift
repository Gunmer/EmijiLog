
import Foundation

public class Logger {
    var className = ""
    public static var configuration = EmojiLogConfiguration()
    
    public init() {}
    
    public init(className: String) {
        self.className = className
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
        if className.isEmpty {
            className = file.components(separatedBy: "/").last!.replacingOccurrences(of: ".swift", with: "")
        }
        
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
