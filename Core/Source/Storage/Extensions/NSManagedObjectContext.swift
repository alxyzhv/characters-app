import CoreData

extension NSManagedObjectContext {

    /// Сохранить без обработки ошибок
    func tryToSave() {
        guard hasChanges else { return }

        do {
            try save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
