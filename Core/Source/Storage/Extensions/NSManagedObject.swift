import CoreData

extension NSManagedObject {

    /// Имя сущности в БД
    static var entityName: String {
        let prefix = "DB"
        var name = String(describing: self)
        if name.starts(with: prefix) {
            name.removeFirst(prefix.count)
        }
        return name
    }
}
