import Foundation

public protocol IParser {

    /// Тип модели для парсинга
    associatedtype Model
    /// Парсит модель из данных
    func parse(from data: Data) throws -> Model
}
