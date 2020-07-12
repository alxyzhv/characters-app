public protocol Configurable {

    /// Тип соответсвующей модели конфигурации
    associatedtype Model

    /// Сконфигурировать с моделью
    func configure(with model: Model)
}
