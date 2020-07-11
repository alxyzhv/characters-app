import Foundation

extension URLComponents {

    /// Инициализировать с параметрами из запроса
    init(request: Request) {
        self.init()

        scheme = request.scheme.rawValue
        host = request.baseUrl
        path = request.path
        queryItems = request.parameters.map { name, value in
            URLQueryItem(name: name, value: value.description)
        }
    }
}
