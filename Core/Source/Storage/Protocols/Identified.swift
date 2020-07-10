public protocol Identified {
    /// Ключ для сохранения идентификатора
    static var identifierKey: String { get }
    /// Уникальный идентификатор модели
    var identifier: String { get }
}

public extension Identified {
    static var identifierKey: String { return "identifier" }
}
