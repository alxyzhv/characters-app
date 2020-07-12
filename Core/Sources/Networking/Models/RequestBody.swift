import Foundation

/// Тело запроса
public enum RequestBody {

    case data(Data)

    case json([String: CustomStringConvertible])

    case string(String)

    /// Преобразовать тело запроса в Data
    func encode() throws -> Data? {
        switch self {
        case .data(let data):
            return data
        case .json(let json):
            return try JSONSerialization.data(withJSONObject: json)
        case .string(let string):
            return string.data(using: .utf8)
        }
    }
}
