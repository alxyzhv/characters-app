public protocol Assembly {

    /// Зарегистрировать зависимости в контейнере
    func assemble(container: Container)
}
