import Foundation

/// Сущность для построения запросов
final public class RequestBuilder: IRequestBuilder {

    // MARK: - Initiliazation

    public init() {}

    // MARK: - IRequestBuilder

    public func build(from request: Request) throws -> URLRequest {
        let urlComponents = URLComponents(request: request)
        guard let url = urlComponents.url else {
            throw NetworkingError.invalidUrl(urlComponents)
        }

        var urlRequest = URLRequest(url: url)
        request.headers.forEach { urlRequest.addValue($0.key, forHTTPHeaderField: $0.value) }

        if case .json = request.body {
            urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }

        do {
            urlRequest.httpBody = try request.body?.encode()
        } catch {
            throw NetworkingError.invalidRequestBody(error)
        }

        return urlRequest
    }
}
