import Foundation

public enum NetworkingError: Error {

    case decodingFailed(Error?)

    case emptyResponse

    case invalidRequestBody(Error)

    case invalidUrl(URLComponents)

    case other(Error)
}
