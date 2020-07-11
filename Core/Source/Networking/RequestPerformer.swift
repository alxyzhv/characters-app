import Foundation

/// Сущность для выполнения запросов
final public class RequestPerformer: IRequestPerfomer {

    // MARK: - Properties

    private let requestBuilder: IRequestBuilder

    // MARK: - Initialization

    public init(requestBuilder: IRequestBuilder) {
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
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                if let error = error {
                    return completion(.failure(NetworkingError.other(error)))
                }

                guard let data = data else {
                    return completion(.failure(NetworkingError.emptyResponse))
                }

                do {
                    completion(.success(try parser.parse(from: data)))
                } catch {
                    completion(.failure(error))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(error))
        }
    }
}
