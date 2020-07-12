public protocol IStorage {

    typealias Model = Storable & Identified

    /// Получить модель по идентификатору
    func read<T: Model>(_ type: T.Type, by identifier: String, completion: @escaping (T?) -> Void)
    /// Получить все модели
    func readAll<T: Model>(_ type: T.Type, completion: @escaping ([T]) -> Void)

    /// Удалить модель по идентификатору
    func erase<T: Model>(_ type: T.Type, by identifier: String, completion: @escaping () -> Void)
    /// Удалить все модели
    func eraseAll<T: Model>(_ type: T.Type, completion: @escaping () -> Void)

    /// Сохранить модель
    func persist<T: Model>(_ model: T, completion: @escaping () -> Void)
    /// Сохранить модели
    func persist<T: Model>(_ models: [T], completion: @escaping () -> Void)

    /// Удалить модель
    func erase<T: Model>(_ model: T, completion: @escaping () -> Void)
    /// Удалить модели
    func erase<T: Model>(_ models: [T], completion: @escaping () -> Void)
}
