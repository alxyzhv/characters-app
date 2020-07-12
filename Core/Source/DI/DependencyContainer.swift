/// Контейнер для хранения зависимостей
public class DependencyContainer: Container {

    // MARK: - Properties

    private var dependencies = [String: Dependency]()

    // MARK: - Initialization

    public init() {}

    // MARK: - Container

    public func register<T>(_ dependency: Dependency, as type: T.Type) {
        let key = String(describing: type.self)
        dependencies[key] = dependency
    }

    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key]

        switch dependency {
        case .instance(let instance):
            guard let instance = instance as? T else {
                fatalError("\(T.self) not resolved")
            }
            return instance
        case .factory(let factory):
            guard let instance = factory(self) as? T else {
                fatalError("\(T.self) not resolved")
            }
            return instance
        default:
            fatalError("\(T.self) not resolved")
        }
    }
}
