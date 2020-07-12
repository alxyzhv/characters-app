import UIKit

/// Парсер для картинок
struct ImageParser: IParser {

    // MARK: - IParser

    func parse(from data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw NetworkingError.decodingFailed(nil)
        }
        return image
    }
}
