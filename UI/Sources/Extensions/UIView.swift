import UIKit

extension UIView {

    /// Ближайший UIViewController
    var viewController: UIViewController? {
        switch next {
        case let viewController as UIViewController:
            return viewController
        case let view as UIView:
            return view.viewController
        default:
            return nil
        }
    }
}
