
public protocol Printer {
    func printTrace(trace trace: String)
}

class PrinterDefault: Printer {
    func printTrace(trace trace: String) {
        print(trace)
    }
}
