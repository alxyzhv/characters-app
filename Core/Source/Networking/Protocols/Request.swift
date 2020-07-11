public protocol Request {

    /// Схема
    var scheme: RequestScheme { get }

    /// Базовый url
    var baseUrl: String { get }

    /// Путь
    var path: String { get }

    /// HTTP метод
    var method: RequestMethod { get }

    /// HTTP заголовки
    var headers: [String: String] { get }

    /// Параметры
    var parameters: [String: CustomStringConvertible] { get }

    /// Тело запроса
    var body: RequestBody? { get }
}

public extension Request {

    var scheme: RequestScheme {
        .https
    }

    var method: RequestMethod {
        .get
    }

    var headers: [String: String] {
        [:]
    }

    var parameters: [String: CustomStringConvertible] {
        [:]
    }

    var body: RequestBody? {
        nil
    }
}
