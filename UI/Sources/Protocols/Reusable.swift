import UIKit

public protocol Reusable {

    /// Идентификатор для переиспользования
    static var reuseIdentifier: String { get }
}
