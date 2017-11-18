
import Foundation

open class Logger {
    let className: String
    let configuration: EmojiLogConfiguration
    
    init(className: String, configuration: EmojiLogConfiguration) {
        self.className = className
        self.configuration = configuration
    }
    
    open func debug(_ message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .debug, message: message, functionName: functionName, line: line)
    }
    
    open func info(_ message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .info, message: message, functionName: functionName, line: line)
    }
    
    open func warning(_ message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .waring, message: message, functionName: functionName, line: line)
    }
    
    open func error(_ message: String, functionName: String = #function, line: Int = #line) {
        self.printTrace(level: .error, message: message, functionName: functionName, line: line)
    }
    
    fileprivate func printTrace(level: LogLevel,message: String, functionName: String, line: Int) {
        if configuration.disable {
            return
        }
        
        if level.rawValue < configuration.minLevel.rawValue {
            return
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
    
    public static func getLog(logged: Any) -> Logger {
        return Logger(className: "\(Mirror(reflecting: logged).subjectType)", configuration: configuration)
    }
    
}
