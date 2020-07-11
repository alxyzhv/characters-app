import CoreData

final public class Storage: IStorage {

    // MARK: - Properties

    private let name: String

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: name)
        container.loadPersistentStores { (_, error) in
            guard let error = error as NSError? else { return }
            print("Failed to load persistent stores: \(error)")
        }
        return container
    }()

    // MARK: - Initialization

    public init(name: String) {
        self.name = name
    }

    // MARK: - IStorage

    public func read<T: IStorage.Model>(_ type: T.Type, by identifier: String, completion: @escaping (T?) -> Void) {
        persistentContainer.performBackgroundTask { context in
            let request = T.fetchRequest
            request.predicate = NSPredicate(format: "%K = %@", T.identifierKey, identifier)
            let results = try? context.fetch(request)
            let model = results?.first.flatMap(T.init)
            completion(model)
        }
    }

    public func readAll<T: IStorage.Model>(_ type: T.Type, completion: @escaping ([T]) -> Void) {
        persistentContainer.performBackgroundTask { context in
            let results = try? context.fetch(T.fetchRequest)
            let models = results?.compactMap(T.init) ?? []
            completion(models)
        }
    }

    public func erase<T: IStorage.Model>(_ type: T.Type, by identifier: String, completion: @escaping () -> Void) {
        persistentContainer.performBackgroundTask { context in
            defer { completion() }

            let request = T.fetchRequest
            request.predicate = NSPredicate(format: "%K = %@", T.identifierKey, identifier)
            let results = try? context.fetch(request)
            results?.forEach(context.delete)
            context.tryToSave()
        }
    }

    public func eraseAll<T: IStorage.Model>(_ type: T.Type, completion: @escaping () -> Void) {
        persistentContainer.performBackgroundTask { context in
            defer { completion() }

            let results = try? context.fetch(T.fetchRequest)
            results?.forEach(context.delete)
            context.tryToSave()
        }
    }

    public func persist<T: IStorage.Model>(_ model: T, completion: @escaping () -> Void) {
        persistentContainer.performBackgroundTask { context in
            defer { completion() }

            let results = try? context.fetch(T.fetchRequest)
            let dbModel = results?.first ?? T.DBModel(context: context)
            model.save(to: dbModel)
            context.tryToSave()
        }
    }

    public func persist<T: IStorage.Model>(_ models: [T], completion: @escaping () -> Void) {
        persistentContainer.performBackgroundTask { context in
            defer { completion() }

            models.forEach {
                let request = T.fetchRequest
                request.predicate = NSPredicate(format: "%K = %@", T.identifierKey, $0.identifier)
                let results = try? context.fetch(request)
                let dbModel = results?.first ?? T.DBModel(context: context)
                $0.save(to: dbModel)
            }
            context.tryToSave()
        }
    }

    public func erase<T: IStorage.Model>(_ model: T, completion: @escaping () -> Void) {
        erase(T.self, by: model.identifier, completion: completion)
    }

    public func erase<T: IStorage.Model>(_ models: [T], completion: @escaping () -> Void) {
        persistentContainer.performBackgroundTask { context in
            defer { completion() }

            let identifiers = models.map(\.identifier)
            let request = T.fetchRequest
            request.predicate = NSPredicate(format: "%K IN %@", T.identifierKey, identifiers)
            let results = try? context.fetch(request)
            results?.forEach(context.delete)
            context.tryToSave()
        }
    }
}
