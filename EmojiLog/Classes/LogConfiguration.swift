
import Foundation

public class EmojiLogConfiguration {
    var printer: Printer
    var emojiMap: EmojiMap
    var traceBuilder: TraceBuilder
    var minLevel: LogLevel
    var disable: Bool
    
    init() {
        printer = PrinterDefault()
        emojiMap = EmojiMapDefault()
        traceBuilder = TraceBuilderDefault()
        minLevel = .debug
        disable = false
    }
    
    public func change(printer printer: Printer) {
        self.printer = printer
    }
    
    public func change(emojiMap emojiMap: EmojiMap) {
        self.emojiMap = emojiMap
    }
    
    public func change(traceBuilder traceBuilder: TraceBuilder) {
        self.traceBuilder = traceBuilder
    }
    
    public func change(minLevel minLevel: LogLevel) {
        self.minLevel = minLevel
    }
    
    public func change(disable disable: Bool) {
        self.disable = disable
    }
    
}
