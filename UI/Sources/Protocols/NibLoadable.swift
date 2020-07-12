import UIKit

public protocol NibLoadable {

    /// Nib файл
    static var nib: UINib { get }
}

public extension NibLoadable where Self: UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
}
