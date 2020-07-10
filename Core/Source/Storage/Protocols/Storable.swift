import CoreData

public protocol Storable {
    /// Соотвествующая модель для хранения в БД
    associatedtype DBModel: NSManagedObject
    /// Инициализация из модели БД
    init?(from model: DBModel)
    /// Сохранить в БД
    func save(to model: DBModel)
}

extension Storable {

    /// Инициализация из опциональной модели БД
    init?(from model: DBModel?) {
        guard let model = model else { return nil}
        self.init(from: model)
    }

    /// Соответсвующий fetchRequest для модели
    static var fetchRequest: NSFetchRequest<DBModel> {
        return NSFetchRequest<DBModel>(entityName: DBModel.entityName)
    }
}
