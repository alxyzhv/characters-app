public protocol Resolver {

    /// Получить зависимость
    func resolve<T>() -> T
}
