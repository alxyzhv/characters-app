import Foundation

/// Парсер, просто возвращающий полученные данные
public struct DataParser: IParser {

    // MARK: - Initialization

    public init() {}

    // MARK: - IParser

    public func parse(from data: Data) -> Data {
        return data
    }
}
