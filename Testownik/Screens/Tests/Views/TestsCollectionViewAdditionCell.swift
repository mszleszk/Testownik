import UIKit

final class TestsCollectionViewAdditionCell: BaseCell {
    private let verticalStackView = UIStackView(axis: .vertical, spacing: 5)
    private let plusImageView = TestsCollectionViewAdditionCell.makePlusImageView()
    private let addLabel = UILabel(text: L10n.Tests.addTest, fontSize: K.Text.primaryTextSize, weight: .bold, color: Asset.Colors.systemBlue.color, alignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TestsCollectionViewAdditionCell: ViewCodeProtocol {
    func buildHierarchy() {
        contentView.addSubviews([
            verticalStackView
        ])
        
        verticalStackView.addArrangedSubviews([
            plusImageView,
            addLabel
        ])
    }
    
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: K.Cell.innerInset, left: K.Cell.innerInset, bottom: K.Cell.innerInset, right: K.Cell.innerInset))
        }
    }
    
    func setupProperties() {
        contentView.backgroundColor = Asset.Colors.systemBlue.color.withAlphaComponent(0.2)
        contentView.layer.cornerRadius = K.View.cornerRadius
    }
}

// MARK: - Builder
private extension TestsCollectionViewAdditionCell {
    static func makePlusImageView() -> UIImageView {
        return UIImageView().also {
            $0.image = UIImage(systemName: "plus.circle.fill")
            $0.contentMode = .scaleAspectFit
            $0.tintColor = Asset.Colors.systemBlue.color
        }
    }
}
