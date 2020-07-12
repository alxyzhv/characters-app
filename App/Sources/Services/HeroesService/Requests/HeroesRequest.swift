import Core

enum HeroesRequest: Request {

    case heroes(page: Int)
    case hero(identifier: Int)

    var baseUrl: String {
        "rickandmortyapi.com"
    }

    var path: String {
        switch self {
        case .heroes: return "/api/character/"
        case .hero(let identifier): return "/api/character/\(identifier)"
        }
    }

    var parameters: [String: CustomStringConvertible] {
        switch self {
        case .heroes(let page): return ["page": page]
        case .hero: return [:]
        }
    }
}
