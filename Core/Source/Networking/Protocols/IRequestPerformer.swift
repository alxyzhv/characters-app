import UIKit

public protocol IRequestPerfomer {

    /// Выполнить запрос
    func perform<Model, Parser: IParser>(
        _ request: Request,
        use parser: Parser,
        completion: @escaping (Result<Model, Error>) -> Void
    ) where Model == Parser.Model

    /// Загрузить данные по запросу
    func loadData(from request: Request, completion: @escaping (Result<Data, Error>) -> Void)

    /// Загрузить картинку по запросу
    func loadImage(from request: Request, completion: @escaping (Result<UIImage, Error>) -> Void)

    /// Загрузить Decodable модель по запросу
    func loadModel<Model: Decodable>(from request: Request, completion: @escaping (Result<Model, Error>) -> Void)
}
