import UIKit

public protocol AnyCellViewModel {

    /// Тип ячейки ассоциированный с моделью
    static var cellClass: UITableViewCell.Type { get }

    /// Настроить ячейку
    func setup(_ cell: UITableViewCell)
}

public protocol CellViewModel: AnyCellViewModel {

    /// Тип ячейки ассоциированный с моделью
    associatedtype Cell: UITableViewCell

    /// Настроить ячейку
    func setup(_ cell: Cell)
}

public extension CellViewModel {

    static var cellClass: UITableViewCell.Type { return Cell.self }

    func setup(_ cell: UITableViewCell) {
        guard let cell = cell as? Cell else { return }
        setup(cell)
    }
}
