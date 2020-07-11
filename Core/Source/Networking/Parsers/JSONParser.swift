import Foundation

/// Парсер для json
public struct JsonParser<T: Decodable>: IParser {

    // MARK: - Initialization

    public init() {}

    // MARK: - IParser

    public func parse(from data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkingError.decodingFailed(error)
        }
    }
}
