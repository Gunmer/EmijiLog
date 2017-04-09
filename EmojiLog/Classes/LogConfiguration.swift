
import Foundation

public class EmojiLogConfiguration {
    var printer: Printer
    var emojiMap: EmojiMap
    var traceBuilder: TraceBuilder
    
    init() {
        printer = PrinterDefault()
        emojiMap = EmojiMapDefault()
        traceBuilder = TraceBuilderDefault()
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
    
}
