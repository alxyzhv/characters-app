public enum Dependency {

    /// Зарегистрировать синглтон
    case instance(Any)

    /// Зарегистрировать метод для создания объекта
    case factory((Resolver) -> Any)
}
