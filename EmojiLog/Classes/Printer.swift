
public protocol Printer {
    func printTrace(trace: String)
}

class PrinterDefault: Printer {
    func printTrace(trace: String) {
        print(trace)
    }
}
