import Foundation

/// Парсер для json
struct JsonParser<T: Decodable>: IParser {

    // MARK: - IParser

    func parse(from data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkingError.decodingFailed(error)
        }
    }
}
