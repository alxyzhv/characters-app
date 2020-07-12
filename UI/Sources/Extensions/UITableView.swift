import UIKit

public extension UITableView {

    /// Получить ячейку и сконфигурировать с CellViewModel
    func dequeueReusableCell(with viewModel: AnyCellViewModel, for indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: type(of: viewModel).cellClass.reuseIdentifier, for: indexPath)
        viewModel.setup(cell)
        return cell
    }

    /// Зарегистрировать ячейку
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    /// Зарегистрировать ячейку
    func register<T: UITableViewCell>(_ cellClass: T.Type) where T: NibLoadable {
        register(cellClass.nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
}

extension UITableViewCell: Reusable {

    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
