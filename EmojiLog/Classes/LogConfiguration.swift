
import Foundation

open class EmojiLogConfiguration {
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
    
    open func change(printer: Printer) {
        self.printer = printer
    }
    
    open func change(emojiMap: EmojiMap) {
        self.emojiMap = emojiMap
    }
    
    open func change(traceBuilder: TraceBuilder) {
        self.traceBuilder = traceBuilder
    }
    
    open func change(minLevel: LogLevel) {
        self.minLevel = minLevel
    }
    
    open func change(disable: Bool) {
        self.disable = disable
    }
    
}
