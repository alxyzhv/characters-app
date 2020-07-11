import UIKit

/// Парсер для картинок
public struct ImageParser: IParser {

    // MARK: - Initialization

    public init() {}

    // MARK: - IParser

    public func parse(from data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw NetworkingError.decodingFailed(nil)
        }
        return image
    }
}
