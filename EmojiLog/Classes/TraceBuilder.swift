
public protocol TraceBuilder {
    func add(emoji: String) -> Self
    func add(level: LogLevel) -> Self
    func add(date: NSDate) -> Self
    func add(className: String) -> Self
    func add(functionName: String) -> Self
    func add(message: String) -> Self
    func add(dateFormat: String) -> Self
    func add(line: Int) -> Self
    
    func build() -> String
}

class TraceBuilderDefault: TraceBuilder {
    private var className = ""
    private var date = NSDate()
    private var emoji = ""
    private var functionName = ""
    private var level = LogLevel.debug
    private var message = ""
    private var dateFormat = "dd/MM/yyyy HH:mm:ss:SSS"
    private var line = 0
    
    func add(className: String) -> Self {
        self.className = className
        return self
    }
    
    func add(date: NSDate) -> Self {
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
        
        return "\(emoji) |\(level.initial)| \(formater.string(from: date as Date)) -> \(className).\(functionName)[\(line)]: \(message)"
    }
}
