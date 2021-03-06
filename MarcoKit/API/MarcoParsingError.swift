import Foundation

/** Marco parsing error. */
public class MarcoParsingError : Error {
    /** Error kind. */
    public let kind: ErrorKind

    /** Error offset. */
    public let index: String.Index

    /** Error message. */
    public let message: String

    internal init(kind: ErrorKind, index: String.Index, message: String) {
        self.kind = kind
        self.index = index
        self.message = message
    }

    public enum ErrorKind : Int {
        case unknown
    }
}

/** Marco non-strict parsing error. This is only thrown when the `Marco.Options.nonStrict` flag is set. */
public class MarcoNonStrictParsingError : Error {
    /** Parsing errors. */
    public let errors: [MarcoParsingError]

    /** Parsed document. */
    public let document: MarcoDocument
    
    public var localizedDescription: String {
        return errors.lazy.map { $0.localizedDescription }.joined()
    }

    internal init(errors: [MarcoParsingError], document: MarcoDocument) {
        self.errors = errors
        self.document = document
    }
}
