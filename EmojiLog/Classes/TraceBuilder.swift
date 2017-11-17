
public protocol TraceBuilder {
    func add(emoji: String) -> Self
    func add(level: LogLevel) -> Self
    func add(date: Date) -> Self
    func add(className: String) -> Self
    func add(functionName: String) -> Self
    func add(message: String) -> Self
    func add(dateFormat: String) -> Self
    func add(line: Int) -> Self
    
    func build() -> String
}

class TraceBuilderDefault: TraceBuilder {
    fileprivate var className = ""
    fileprivate var date = Date()
    fileprivate var emoji = ""
    fileprivate var functionName = ""
    fileprivate var level = LogLevel.debug
    fileprivate var message = ""
    fileprivate var dateFormat = "dd/MM/yyyy HH:mm:ss:SSS"
    fileprivate var line = 0
    
    func add(className: String) -> Self {
        self.className = className
        return self
    }
    
    func add(date: Date) -> Self {
        self.date = date
        return self
    }
    
    func add(emoji: String) -> Self {
        self.emoji = emoji
        return self
    }
    
    func add(functionName: String) -> Self {
        if functionName.hasSuffix("()") {
            self.functionName = functionName.replacingOccurrences(of: "()", with: "")
        } else {
            self.functionName = functionName
        }
        return self
    }
    
    func add(level: LogLevel) -> Self {
        self.level = level
        return self
    }
    
    func add(message: String) -> Self {
        self.message = message
        return self
    }
    
    func add(dateFormat: String) -> Self {
        self.dateFormat = dateFormat
        return self
    }
    
    func add(line: Int) -> Self {
        self.line = line
        return self
    }
    func build() -> String {
        let formater = DateFormatter()
        formater.dateFormat = dateFormat
        
        let stringDate = formater.string(from: date)
        
        return "\(emoji) |\(level.initial)| \(stringDate) -> \(className).\(functionName)[\(line)]: \(message)"
    }
}
