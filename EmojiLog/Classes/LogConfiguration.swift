
import Foundation

public class EmojiLogConfiguration {
    var printer: Printer
    var emojiMap: EmojiMap
    var traceBuilder: TraceBuilder
    var minLevel: LogLevel
    
    init() {
        printer = PrinterDefault()
        emojiMap = EmojiMapDefault()
        traceBuilder = TraceBuilderDefault()
        minLevel = .debug
    }
    
    public func change(printer: Printer) {
        self.printer = printer
    }
    
    public func change(emojiMap: EmojiMap) {
        self.emojiMap = emojiMap
    }
    
    public func change(traceBuilder: TraceBuilder) {
        self.traceBuilder = traceBuilder
    }
    
    public func change(minLevel: LogLevel) {
        self.minLevel = minLevel
    }
    
}
