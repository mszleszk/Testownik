import UIKit
import SnapKit

final class TestsView: UIView {
    private let verticalStackView = UIStackView(axis: .vertical, spacing: 20)
    private let appNameLabel = TestsView.makeAppNameLabel()
    
    let collectionView = TestsCollectionView()
    
    init() {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TestsView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews([
            verticalStackView
        ])
        
        verticalStackView.addArrangedSubviews([
            appNameLabel,
            collectionView
        ])
    }
    
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges).inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        
        [appNameLabel,
         collectionView
        ].forEach { view in
            view.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
            }
        }
    }
    
    func setupProperties() {
        backgroundColor = Asset.Colors.background.color
    }
}

// MARK: - Builder
private extension TestsView {
    static func makeAppNameLabel() -> UILabel {
        return UILabel(text: L10n.General.appname, fontSize: 50, weight: .bold, color: Asset.Colors.primaryText.color).also {
            $0.textAlignment = .center
        }
    }
}
