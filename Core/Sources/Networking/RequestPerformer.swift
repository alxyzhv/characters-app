import UIKit

/// Сущность для выполнения запросов
final public class RequestPerformer: IRequestPerfomer {

    // MARK: - Properties

    private let urlSession: URLSession
    private let requestBuilder: IRequestBuilder

    // MARK: - Initialization

    public init(urlSessionConfiguration: URLSessionConfiguration, requestBuilder: IRequestBuilder) {
        self.urlSession = URLSession(configuration: urlSessionConfiguration)
        self.requestBuilder = requestBuilder
    }

    // MARK: - IRequestPerformer

    public func perform<Model, Parser: IParser>(
        _ request: Request,
        use parser: Parser,
        completion: @escaping (Result<Model, Error>) -> Void
    ) where Model == Parser.Model {

        do {
            let urlRequest = try requestBuilder.build(from: request)
            let dataTask = urlSession.dataTask(with: urlRequest) { data, _, error in
                if let error = error {
                    return completion(.failure(NetworkingError.other(error)))
                }

                guard let data = data else {
                    return completion(.failure(NetworkingError.emptyResponse))
                }

                let result = Result { try parser.parse(from: data) }
                completion(result)
            }
            dataTask.resume()
        } catch {
            completion(.failure(error))
        }
    }

    public func loadData(from request: Request, completion: @escaping (Result<Data, Error>) -> Void) {
        perform(request, use: DataParser(), completion: completion)
    }

    public func loadImage(from request: Request, completion: @escaping (Result<UIImage, Error>) -> Void) {
        perform(request, use: ImageParser(), completion: completion)
    }

    public func loadModel<Model: Decodable>(from request: Request,
                                            completion: @escaping (Result<Model, Error>) -> Void) {
        perform(request, use: JsonParser(), completion: completion)
    }
}
