import UIKit

public class StackViewContainer: UIView {

    // MARK: - Subviews

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    // MARK: - Initialization

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    public func placeSubview(_ subview: UIView) {
        stackView.addArrangedSubview(subview)
    }

    public func placeChildViewController(_ childViewController: UIViewController) {
        guard let viewController = viewController else { return }
        viewController.addChild(childViewController)
        stackView.addArrangedSubview(childViewController.view)
        childViewController.didMove(toParent: viewController)
    }

    // MARK: - Private

    private func setupUI() {
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.frameLayoutGuide.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: scrollView.contentLayoutGuide.widthAnchor)
        ])

        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            scrollView.contentLayoutGuide.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
            scrollView.contentLayoutGuide.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
}
