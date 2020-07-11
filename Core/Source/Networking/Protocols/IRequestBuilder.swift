import Foundation

public protocol IRequestBuilder {
    /// Построить URLRequest из запроса
    func build(from request: Request) throws -> URLRequest
}
