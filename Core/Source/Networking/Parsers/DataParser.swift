import Foundation

/// Парсер, просто возвращающий полученные данные
struct DataParser: IParser {

    // MARK: - IParser

    func parse(from data: Data) -> Data {
        return data
    }
}
