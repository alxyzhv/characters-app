import Foundation

/// Парсер для json
struct JsonParser<Model: Decodable>: IParser {

    // MARK: - IParser

    func parse(from data: Data) throws -> Model {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(Model.self, from: data)
        } catch {
            throw NetworkingError.decodingFailed(error)
        }
    }
}
