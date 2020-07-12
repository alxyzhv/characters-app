protocol IHeroesService {

    /// Получить список героев со страницы
    func getHeroes(from page: Int, completion: @escaping (Result<[Hero], Error>) -> Void)

    /// Получить героя по айди
    func getHero(by identifier: Int, completion: @escaping (Result<Hero, Error>) -> Void)
}
