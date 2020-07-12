import UIKit

open class BaseViewController: UIViewController {

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
