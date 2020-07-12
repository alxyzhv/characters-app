public protocol Selectable {

    /// Действие, вызываемое при выборе элемента
    var onSelect: () -> Void { get }
}
