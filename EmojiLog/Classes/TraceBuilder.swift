
public protocol TraceBuilder {
    func add(emoji emoji: String) -> Self
    func add(level level: LogLevel) -> Self
    func add(date date: NSDate) -> Self
    func add(className className: String) -> Self
    func add(functionName functionName: String) -> Self
    func add(message message: String) -> Self
    func add(dateFormat dateFormat: String) -> Self
    func add(line line: Int) -> Self
    
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
    
    func add(className className: String) -> Self {
        self.className = className
        return self
    }
    
    func add(date date: NSDate) -> Self {
        self.date = date
        return self
    }
    
    func add(emoji emoji: String) -> Self {
        self.emoji = emoji
        return self
    }
    
    func add(functionName functionName: String) -> Self {
        if functionName.hasSuffix("()") {
            self.functionName = functionName.stringByReplacingOccurrencesOfString("()", withString: "")
        } else {
            self.functionName = functionName
        }
        return self
    }
    
    func add(level level: LogLevel) -> Self {
        self.level = level
        return self
    }
    
    func add(message message: String) -> Self {
        self.message = message
        return self
    }
    
    func add(dateFormat dateFormat: String) -> Self {
        self.dateFormat = dateFormat
        return self
    }
    
    func add(line line: Int) -> Self {
        self.line = line
        return self
    }
    func build() -> String {
        let formater = NSDateFormatter()
        formater.dateFormat = dateFormat
        
        let stringDate = formater.stringFromDate(date)
        
        return "\(emoji) |\(level.initial)| \(stringDate) -> \(className).\(functionName)[\(line)]: \(message)"
    }
}
