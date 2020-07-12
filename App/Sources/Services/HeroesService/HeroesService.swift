import Core

/// Сервис для получения информации о героях
final class HeroesService: IHeroesService {

    // MARK: - Properties

    private let requestPerformer: IRequestPerfomer

    // MARK: - Initialization

    init(requestPerformer: IRequestPerfomer) {
        self.requestPerformer = requestPerformer
    }

    // MARK: - IHeroesService

    func getHeroes(from page: Int, completion: @escaping (Result<[Hero], Error>) -> Void) {
        let request = HeroesRequest.heroes(page: page)
        requestPerformer.loadModel(from: request) { (result: Result<HeroesList, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getHero(by identifier: Int, completion: @escaping (Result<Hero, Error>) -> Void) {
        let request = HeroesRequest.hero(identifier: identifier)
        requestPerformer.loadModel(from: request, completion: completion)
    }
}
