public protocol Container: Resolver {

    /// Зарегистрировать зависимость
    func register<T>(_ dependency: Dependency, as type: T.Type)
}
